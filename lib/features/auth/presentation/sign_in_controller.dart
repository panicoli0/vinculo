import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/analytics/analytics_event.dart';
import '../../../core/analytics/analytics_providers.dart';
import '../../../core/errors/app_failure.dart';
import '../domain/sign_in_method.dart';
import '../domain/sign_in_outcome.dart';
import 'auth_providers.dart';

part 'sign_in_controller.g.dart';

/// Runs the social sign-ins and logs `sign_in_completed`.
///
/// Vive fuera de la pantalla a propósito: al iniciar sesión el router saca al
/// usuario de `/sign-in` antes de que termine el `await`, y un `ref` de widget
/// ya desmontado no puede loguear el evento. Es `keepAlive` porque un
/// notifier autoDispose sin listeners se destruiría durante ese mismo `await`.
///
/// El estado es el resultado del último inicio de sesión (null antes de
/// cualquiera): la pantalla de edad lo lee para prellenar el nombre.
@Riverpod(keepAlive: true)
class SignInController extends _$SignInController {
  @override
  SignInOutcome? build() => null;

  /// Signs in with Google; returns the failure, or null on success.
  Future<AppFailure?> signInWithGoogle() => _run(
    SignInMethod.google,
    () => ref.read(authRepositoryProvider).signInWithGoogle(),
  );

  /// Signs in with Apple; returns the failure, or null on success.
  Future<AppFailure?> signInWithApple() => _run(
    SignInMethod.apple,
    () => ref.read(authRepositoryProvider).signInWithApple(),
  );

  Future<AppFailure?> _run(
    SignInMethod method,
    Future<SignInOutcome> Function() signIn,
  ) async {
    // Se descarta el resultado anterior antes de empezar: el nombre de otra
    // cuenta (p. ej. un menor rechazado) no debe llegar a la próxima persona.
    state = null;
    try {
      final SignInOutcome outcome = await signIn();
      if (!ref.mounted) {
        return null;
      }
      state = outcome;
      // Se lee el servicio al loguear: el gate de consentimiento puede haber
      // cambiado el servicio mientras duraba el inicio de sesión.
      ref
          .read(analyticsServiceProvider)
          .log(
            AnalyticsEvent.signInCompleted(
              method: method,
              isNewUser: outcome.isNewUser,
            ),
          );
      return null;
    } on AppFailure catch (failure) {
      return failure;
    }
  }
}
