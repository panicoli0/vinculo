import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_route.dart';
import '../../../../core/assets/app_illustration.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/failure_message.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/illustration_view.dart';
import '../../../../core/widgets/primary_pill_button.dart';
import '../../../../core/widgets/segmented_choice.dart';
import '../../../preferences/domain/device_preferences.dart';
import '../../../preferences/domain/ui_locale_option.dart';
import '../../../preferences/presentation/preferences_providers.dart';

/// First screen of the signed-out flow (spec §5.1): language, analytics
/// consent and the way into sign-in.
final class WelcomeScreen extends ConsumerWidget {
  /// Creates the screen.
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Translations t = context.t;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final UiLocaleOption storedLocale = ref.watch(
      preferencesControllerProvider.select(
        (DevicePreferences preferences) => preferences.uiLocale,
      ),
    );
    final bool? consent = ref.watch(
      preferencesControllerProvider.select(
        (DevicePreferences preferences) => preferences.analyticsConsent,
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
                  const Center(
                    child: IllustrationView(
                      illustration: AppIllustration.tree,
                      size: 160,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    t.welcome.title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    t.welcome.subtitle,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SegmentedChoice<UiLocaleOption>(
                    values: const <UiLocaleOption>[
                      UiLocaleOption.es,
                      UiLocaleOption.en,
                    ],
                    selected: _shownLocale(context, storedLocale),
                    labelOf: (UiLocaleOption option) => _localeLabel(t, option),
                    semanticsLabel: t.welcome.language.label,
                    onChanged: (UiLocaleOption option) =>
                        _run(context, () => _setLocale(ref, option)),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    t.welcome.analytics.question,
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Mismo widget, tamaño y énfasis para las dos respuestas; solo
                  // la ya elegida se marca. Ninguna viene preseleccionada.
                  _ConsentButton(
                    label: t.welcome.analytics.yes,
                    isChosen: consent == true,
                    onPressed: () =>
                        _run(context, () => _setConsent(ref, value: true)),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _ConsentButton(
                    label: t.welcome.analytics.no,
                    isChosen: consent == false,
                    onPressed: () =>
                        _run(context, () => _setConsent(ref, value: false)),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryPillButton(
                    label: t.welcome.start,
                    onPressed: () =>
                        context.pushNamed(AppRoute.signIn.routeName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The option to highlight: the stored one, or the language the device
  /// resolved while the choice is still "follow the system".
  UiLocaleOption _shownLocale(BuildContext context, UiLocaleOption stored) =>
      switch (stored) {
        UiLocaleOption.system =>
          TranslationProvider.of(context).locale == AppLocale.es
              ? UiLocaleOption.es
              : UiLocaleOption.en,
        UiLocaleOption.es || UiLocaleOption.en => stored,
      };

  /// `system` no se ofrece como segmento: la bienvenida solo elige un idioma.
  String _localeLabel(Translations t, UiLocaleOption option) =>
      switch (option) {
        UiLocaleOption.es => t.welcome.language.es,
        UiLocaleOption.en => t.welcome.language.en,
        UiLocaleOption.system => '',
      };

  Future<void> _setLocale(WidgetRef ref, UiLocaleOption option) =>
      ref.read(preferencesControllerProvider.notifier).setUiLocale(option);

  Future<void> _setConsent(WidgetRef ref, {required bool value}) => ref
      .read(preferencesControllerProvider.notifier)
      .setAnalyticsConsent(value: value);

  /// Runs [action] and tells the person when saving the preference failed.
  Future<void> _run(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } on AppFailure catch (failure) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage(context.t, failure))),
      );
    }
  }
}

/// One of the two equally weighted answers to the analytics consent question.
final class _ConsentButton extends StatelessWidget {
  const _ConsentButton({
    required this.label,
    required this.isChosen,
    required this.onPressed,
  });

  final String label;

  /// Whether this is the answer the person already gave.
  final bool isChosen;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    // Un solo tipo de widget para las dos respuestas (spec §5.1: "dos botones
    // de igual peso"): la elegida solo cambia de color y muestra el tilde. El
    // lugar del tilde se reserva siempre para que las medidas no se muevan.
    return Semantics(
      selected: isChosen,
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          style: isChosen
              ? OutlinedButton.styleFrom(
                  backgroundColor: colors.secondaryContainer,
                  foregroundColor: colors.onSecondaryContainer,
                )
              : null,
          icon: Visibility(
            visible: isChosen,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: const Icon(Icons.check),
          ),
          label: Text(label),
        ),
      ),
    );
  }
}
