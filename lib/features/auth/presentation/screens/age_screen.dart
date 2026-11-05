import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/failure_message.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/primary_pill_button.dart';
import '../../../content/domain/card_language.dart';
import '../../../content/domain/card_language_mode.dart';
import '../../../preferences/domain/device_preferences.dart';
import '../../../preferences/presentation/preferences_providers.dart';
import '../../domain/age_check.dart';
import '../../domain/age_policy.dart';
import '../../domain/display_name_policy.dart';
import '../../domain/sign_in_outcome.dart';
import '../auth_providers.dart';
import '../sign_in_controller.dart';
import '../widgets/age_blocked_view.dart';

/// Age gate shown right after the first sign-in (spec §3.1, §5.3).
///
/// Pide el año de nacimiento (sin valor preseleccionado ni pista de la edad
/// mínima) y el nombre. Un adulto crea su `users/{uid}`; un menor no deja nada
/// en Firestore: se borra su cuenta de Auth y se bloquea el teléfono 24 h.
class AgeScreen extends ConsumerStatefulWidget {
  /// Creates the screen.
  const AgeScreen({super.key});

  @override
  ConsumerState<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends ConsumerState<AgeScreen> {
  /// Oldest year offered, counted back from the current one.
  static const int _yearsOffered = 120;

  /// Height of the open year menu, so it scrolls instead of covering the page.
  static const double _menuHeight = 320;

  late final TextEditingController _nameController;

  /// Years in the menu, newest first.
  late final List<int> _years;

  /// Chosen birth year; kept only in this widget and never persisted.
  int? _birthYear;

  /// Chosen card language mode; no preselected value, and never derived from
  /// the UI locale (the two language axes are independent).
  CardLanguageMode? _cardLanguageMode;

  /// Chosen primary language; only asked, and only meaningful, in bilingual
  /// mode.
  CardLanguage? _primaryLanguage;

  bool _isBusy = false;
  AppFailure? _failure;

  @override
  void initState() {
    super.initState();
    final int currentYear = _currentYear();
    _years = List<int>.generate(_yearsOffered + 1, (int i) => currentYear - i);
    // El nombre que devolvió el proveedor es solo un punto de partida: Apple
    // lo manda una vez y puede venir vacío, y en un arranque en frío directo
    // a `/age` no hay resultado alguno, así que el campo funciona vacío.
    _nameController = TextEditingController(
      text: _prefill(ref.read(signInControllerProvider)?.displayName),
    );
    // Si el bloqueo ya estaba vigente (el borrado de Auth pudo fallar la vez
    // anterior), se reintenta el borrado: no debe quedar la cuenta de un menor.
    if (_isLocked(ref.read(preferencesControllerProvider))) {
      unawaited(_retryAuthUserDeletion());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /// [name] cut to the grapheme count the field accepts; empty when there is
  /// none.
  static String _prefill(String? name) =>
      (name ?? '').characters.take(kDisplayNameMaxLength).string;

  /// Year as the server sees it: the rules use `request.time` in UTC, and a
  /// local year one ahead would pass the client and fail the rule.
  int _currentYear() => DateTime.now().toUtc().year;

  bool _isLocked(DevicePreferences preferences) {
    final DateTime? until = preferences.ageGateLockedUntil;
    return until != null && until.isAfter(DateTime.now());
  }

  bool get _canContinue =>
      _birthYear != null &&
      isValidDisplayName(_nameController.text) &&
      _resolvedPrimaryLanguage != null;

  /// Primary language to store, or null while the choice is incomplete.
  ///
  /// En modo inglés o español el idioma principal lo determina el modo (así lo
  /// lee `CardTextView`, que ignora `primaryLanguage` fuera del bilingüe), así
  /// que preguntarlo sería redundante. Solo en bilingüe se le pregunta.
  CardLanguage? get _resolvedPrimaryLanguage => switch (_cardLanguageMode) {
    null => null,
    CardLanguageMode.english => CardLanguage.en,
    CardLanguageMode.spanish => CardLanguage.es,
    CardLanguageMode.bilingual => _primaryLanguage,
  };

  Future<void> _confirm() async {
    final int? birthYear = _birthYear;
    final CardLanguageMode? mode = _cardLanguageMode;
    final CardLanguage? primaryLanguage = _resolvedPrimaryLanguage;
    if (birthYear == null || mode == null || primaryLanguage == null) {
      return;
    }
    setState(() {
      _isBusy = true;
      _failure = null;
    });
    final AgeCheck check = AgePolicy.evaluate(
      birthYear: birthYear,
      currentYear: _currentYear(),
    );
    final AppFailure? failure = await switch (check) {
      AgeCheck.adult => _createAdult(birthYear, mode, primaryLanguage),
      AgeCheck.minor || AgeCheck.minorUnderConsentAge => _rejectMinor(),
    };
    if (!mounted) {
      return;
    }
    setState(() {
      _isBusy = false;
      _failure = failure;
    });
  }

  /// Creates the adult's `users/{uid}`; the router moves on once it exists.
  Future<AppFailure?> _createAdult(
    int birthYear,
    CardLanguageMode mode,
    CardLanguage primaryLanguage,
  ) async {
    final String? uid = ref.read(currentUidProvider);
    if (uid == null) {
      return const AppFailure.auth(message: 'No signed-in account');
    }
    try {
      await ref
          .read(userRepositoryProvider)
          .createAdult(
            uid: uid,
            displayName: _nameController.text.trim(),
            birthYear: birthYear,
            uiLocale: ref.read(preferencesControllerProvider).uiLocale,
            cardLanguageMode: mode,
            primaryLanguage: primaryLanguage,
          );
      return null;
    } on AppFailure catch (failure) {
      return failure;
    }
  }

  /// Locks the device and deletes the Auth user, writing nothing to Firestore.
  ///
  /// Los dos pasos se intentan siempre: si fallara el bloqueo local (p. ej.
  /// `shared_preferences`) y se saliera antes, la cuenta de Auth del menor
  /// quedaría viva y nada la reintentaría (el reintento de `initState` solo
  /// dispara con el bloqueo vigente). Se informa primero el fallo del borrado,
  /// que es el más grave. Mientras el borrado falle, "Continuar" vuelve a
  /// ejecutar ambos pasos.
  Future<AppFailure?> _rejectMinor() async {
    final AppFailure? lockFailure = await _lockAgeGate();
    final AppFailure? deleteFailure = await _deleteAuthUser();
    return deleteFailure ?? lockFailure;
  }

  Future<AppFailure?> _lockAgeGate() async {
    try {
      await ref
          .read(preferencesControllerProvider.notifier)
          .lockAgeGateUntil(DateTime.now().add(kAgeGateLock));
      return null;
    } on AppFailure catch (failure) {
      return failure;
    }
  }

  Future<AppFailure?> _deleteAuthUser() async {
    try {
      await ref.read(authRepositoryProvider).deleteCurrentAuthUser();
      return null;
    } on AppFailure catch (failure) {
      return failure;
    }
  }

  Future<void> _retryAuthUserDeletion() async {
    final AppFailure? failure = await _deleteAuthUser();
    if (!mounted || failure == null) {
      return;
    }
    setState(() => _failure = failure);
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = context.t;
    // Apple puede entregar el resultado un instante después de montar la
    // pantalla; solo se prellena si la persona todavía no escribió nada.
    ref.listen<SignInOutcome?>(signInControllerProvider, (
      SignInOutcome? previous,
      SignInOutcome? next,
    ) {
      final String suggested = _prefill(next?.displayName);
      if (suggested.isNotEmpty && _nameController.text.isEmpty) {
        setState(() => _nameController.text = suggested);
      }
    });
    final bool isLocked = _isLocked(ref.watch(preferencesControllerProvider));
    final AppFailure? failure = _failure;
    final Widget? failureText = failure == null
        ? null
        : Semantics(
            liveRegion: true,
            child: Text(
              failureMessage(t, failure),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (isLocked) const AgeBlockedView() else ..._form(t),
                  if (failureText != null) ...<Widget>[
                    const SizedBox(height: AppSpacing.md),
                    failureText,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _form(Translations t) {
    return <Widget>[
      Text(
        t.age.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const SizedBox(height: AppSpacing.lg),
      // Sin `initialSelection` y sin ninguna pista de la edad mínima (§3.1).
      DropdownMenu<int>(
        expandedInsets: EdgeInsets.zero,
        // Solo se elige de la lista: escribir dejaría el texto y el valor
        // elegido desincronizados.
        requestFocusOnTap: false,
        label: Text(t.age.yearLabel),
        menuHeight: _menuHeight,
        enabled: !_isBusy,
        dropdownMenuEntries: <DropdownMenuEntry<int>>[
          for (final int year in _years)
            DropdownMenuEntry<int>(value: year, label: '$year'),
        ],
        onSelected: (int? year) => setState(() => _birthYear = year),
      ),
      const SizedBox(height: AppSpacing.md),
      TextField(
        controller: _nameController,
        enabled: !_isBusy,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.done,
        autofillHints: const <String>[AutofillHints.givenName],
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(kDisplayNameMaxLength),
        ],
        decoration: InputDecoration(
          labelText: t.age.nameLabel,
          errorText:
              _nameController.text.trim().isNotEmpty &&
                  !isValidDisplayName(_nameController.text)
              ? t.age.nameTooLong
              : null,
        ),
        onChanged: (_) => setState(() {}),
      ),
      const SizedBox(height: AppSpacing.lg),
      _RadioQuestion<CardLanguageMode>(
        title: t.age.cardLanguageTitle,
        groupValue: _cardLanguageMode,
        enabled: !_isBusy,
        options: CardLanguageMode.values,
        labelOf: (CardLanguageMode mode) => switch (mode) {
          CardLanguageMode.english => t.age.cardLanguageEnglish,
          CardLanguageMode.spanish => t.age.cardLanguageSpanish,
          CardLanguageMode.bilingual => t.age.cardLanguageBilingual,
        },
        onChanged: (CardLanguageMode? mode) =>
            setState(() => _cardLanguageMode = mode),
      ),
      if (_cardLanguageMode == CardLanguageMode.bilingual) ...<Widget>[
        const SizedBox(height: AppSpacing.lg),
        _RadioQuestion<CardLanguage>(
          title: t.age.primaryLanguageTitle,
          groupValue: _primaryLanguage,
          enabled: !_isBusy,
          options: CardLanguage.values,
          labelOf: (CardLanguage language) => switch (language) {
            CardLanguage.en => t.age.primaryLanguageEnglish,
            CardLanguage.es => t.age.primaryLanguageSpanish,
          },
          onChanged: (CardLanguage? language) =>
              setState(() => _primaryLanguage = language),
        ),
      ],
      const SizedBox(height: AppSpacing.xl),
      PrimaryPillButton(
        label: t.age.confirm,
        isBusy: _isBusy,
        onPressed: _canContinue ? _confirm : null,
      ),
    ];
  }
}

/// Heading plus a vertical radio group with no preselected option.
///
/// Radios apilados (no un `SegmentedButton`) para que las etiquetas largas
/// salten de línea con texto al 200 % y cada opción sea un destino propio del
/// lector de pantalla.
class _RadioQuestion<T extends Enum> extends StatelessWidget {
  const _RadioQuestion({
    required this.title,
    required this.groupValue,
    required this.enabled,
    required this.options,
    required this.labelOf,
    required this.onChanged,
  });

  final String title;
  final T? groupValue;
  final bool enabled;
  final List<T> options;
  final String Function(T option) labelOf;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Semantics(
          header: true,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        RadioGroup<T>(
          groupValue: groupValue,
          onChanged: onChanged,
          child: Column(
            children: <Widget>[
              for (final T option in options)
                RadioListTile<T>(
                  value: option,
                  enabled: enabled,
                  contentPadding: EdgeInsets.zero,
                  title: Text(labelOf(option)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
