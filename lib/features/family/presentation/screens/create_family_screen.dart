import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/analytics/analytics_event.dart';
import '../../../../core/analytics/analytics_providers.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/failure_message.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/primary_pill_button.dart';
import '../../../auth/presentation/auth_providers.dart';
import '../../domain/family.dart';
import '../../domain/family_name_policy.dart';
import '../family_providers.dart';

/// Naming and creating one's own family (spec §5.4).
///
/// Es la pantalla de quien llega sin invitación: con una pendiente, el router
/// lo manda antes a `/invite/:code`. Al crearse la familia no se navega desde
/// acá — la consulta de familias emite, el gate del router pasa a `ready` y la
/// persona aparece en el jardín.
class CreateFamilyScreen extends ConsumerStatefulWidget {
  /// Creates the screen.
  const CreateFamilyScreen({super.key});

  @override
  ConsumerState<CreateFamilyScreen> createState() => _CreateFamilyScreenState();
}

class _CreateFamilyScreenState extends ConsumerState<CreateFamilyScreen> {
  final TextEditingController _nameController = TextEditingController();

  bool _isBusy = false;
  AppFailure? _failure;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _canContinue => isValidFamilyName(_nameController.text);

  Future<void> _create() async {
    final String name = _nameController.text.trim();
    final String? uid = ref.read(currentUidProvider);
    final String? ownerDisplayName = ref
        .read(currentUserProvider)
        .value
        ?.displayName;
    if (!isValidFamilyName(name) || uid == null || ownerDisplayName == null) {
      // Sin sesión o sin perfil no se llega acá: el gate del router habría
      // redirigido antes. Si pasara igual, no se escribe nada.
      return;
    }
    setState(() {
      _isBusy = true;
      _failure = null;
    });
    AppFailure? failure;
    try {
      final Family family = await ref
          .read(familyRepositoryProvider)
          .createFamily(
            name: name,
            ownerUid: uid,
            ownerDisplayName: ownerDisplayName,
          );
      // Solo el seudónimo de la familia sale del teléfono: nunca su nombre,
      // su id de Firestore ni el uid de nadie (analytics.md §1).
      ref
          .read(analyticsServiceProvider)
          .log(AnalyticsEvent.familyCreated(familyRef: family.analyticsRef));
    } on AppFailure catch (error) {
      failure = error;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _isBusy = false;
      _failure = failure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = context.t;
    final AppFailure? failure = _failure;
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
                  Text(
                    t.createFamily.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    t.createFamily.subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TextField(
                    controller: _nameController,
                    enabled: !_isBusy,
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.done,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(kFamilyNameMaxLength),
                    ],
                    decoration: InputDecoration(
                      labelText: t.createFamily.nameLabel,
                      hintText: t.createFamily.nameHint,
                    ),
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) {
                      if (_canContinue && !_isBusy) {
                        _create();
                      }
                    },
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryPillButton(
                    label: t.createFamily.confirm,
                    isBusy: _isBusy,
                    onPressed: _canContinue ? _create : null,
                  ),
                  if (failure != null) ...<Widget>[
                    const SizedBox(height: AppSpacing.md),
                    Semantics(
                      liveRegion: true,
                      child: Text(
                        failureMessage(t, failure),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
