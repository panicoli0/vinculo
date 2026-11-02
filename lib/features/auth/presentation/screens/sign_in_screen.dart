import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_route.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/failure_message.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/primary_pill_button.dart';
import '../../../../core/widgets/secondary_pill_button.dart';
import '../../../preferences/domain/device_preferences.dart';
import '../../../preferences/presentation/preferences_providers.dart';
import '../../domain/sign_in_method.dart';
import '../sign_in_controller.dart';
import '../widgets/age_blocked_view.dart';

/// Sign-in with Google or Apple (spec §5.2).
///
/// Si el bloqueo de edad sigue vigente muestra el mensaje en lugar de los
/// botones sociales.
class SignInScreen extends ConsumerStatefulWidget {
  /// Creates the screen.
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  /// Method whose sign-in is in progress, if any.
  SignInMethod? _busyMethod;

  /// Failure of the last attempt; the screen stays the same and says so.
  AppFailure? _failure;

  /// Runs [signIn], the controller call for [method], and shows its failure.
  Future<void> _signIn(
    SignInMethod method,
    Future<AppFailure?> Function() signIn,
  ) async {
    setState(() {
      _busyMethod = method;
      _failure = null;
    });
    final AppFailure? failure = await signIn();
    // Al salir bien el router ya pudo haber cerrado esta pantalla.
    if (!mounted) {
      return;
    }
    setState(() {
      _busyMethod = null;
      _failure = failure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = context.t;
    final DateTime? lockedUntil = ref.watch(
      preferencesControllerProvider.select(
        (DevicePreferences preferences) => preferences.ageGateLockedUntil,
      ),
    );
    final bool isLocked =
        lockedUntil != null && lockedUntil.isAfter(DateTime.now());
    final AppFailure? failure = _failure;
    final bool isBusy = _busyMethod != null;
    return Scaffold(
      appBar: AppBar(title: Text(t.screens.signIn.title)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: isLocked
                  ? const AgeBlockedView()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Google y Apple con el mismo peso, en iOS y Android
                        // (App Review 4.8).
                        // TODO(fase-6-marcas-proveedores): estos botones
                        // llevan solo texto y necesitan la marca de cada
                        // proveedor antes de TestFlight/Play: las HIG de
                        // Apple piden `SignInWithAppleButton` (el plugin
                        // sign_in_with_apple ya es dependencia) y las
                        // pautas de Google la "G" en el botón. Su ausencia
                        // es causal de rechazo en la revisión de las tiendas.
                        PrimaryPillButton(
                          label: t.signIn.google,
                          isBusy: _busyMethod == SignInMethod.google,
                          onPressed: isBusy
                              ? null
                              : () => _signIn(
                                  SignInMethod.google,
                                  ref
                                      .read(signInControllerProvider.notifier)
                                      .signInWithGoogle,
                                ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        PrimaryPillButton(
                          label: t.signIn.apple,
                          isBusy: _busyMethod == SignInMethod.apple,
                          onPressed: isBusy
                              ? null
                              : () => _signIn(
                                  SignInMethod.apple,
                                  ref
                                      .read(signInControllerProvider.notifier)
                                      .signInWithApple,
                                ),
                        ),
                        if (failure != null) ...<Widget>[
                          const SizedBox(height: AppSpacing.md),
                          Semantics(
                            liveRegion: true,
                            child: Text(
                              failureMessage(t, failure),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                        ],
                        const SizedBox(height: AppSpacing.xl),
                        SecondaryPillButton(
                          label: t.signIn.haveCode,
                          onPressed: isBusy
                              ? null
                              : () =>
                                    context.pushNamed(AppRoute.code.routeName),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
