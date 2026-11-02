// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Runs the social sign-ins and logs `sign_in_completed`.
///
/// Vive fuera de la pantalla a propósito: al iniciar sesión el router saca al
/// usuario de `/sign-in` antes de que termine el `await`, y un `ref` de widget
/// ya desmontado no puede loguear el evento. Es `keepAlive` porque un
/// notifier autoDispose sin listeners se destruiría durante ese mismo `await`.
///
/// El estado es el resultado del último inicio de sesión (null antes de
/// cualquiera): la pantalla de edad lo lee para prellenar el nombre.

@ProviderFor(SignInController)
final signInControllerProvider = SignInControllerProvider._();

/// Runs the social sign-ins and logs `sign_in_completed`.
///
/// Vive fuera de la pantalla a propósito: al iniciar sesión el router saca al
/// usuario de `/sign-in` antes de que termine el `await`, y un `ref` de widget
/// ya desmontado no puede loguear el evento. Es `keepAlive` porque un
/// notifier autoDispose sin listeners se destruiría durante ese mismo `await`.
///
/// El estado es el resultado del último inicio de sesión (null antes de
/// cualquiera): la pantalla de edad lo lee para prellenar el nombre.
final class SignInControllerProvider
    extends $NotifierProvider<SignInController, SignInOutcome?> {
  /// Runs the social sign-ins and logs `sign_in_completed`.
  ///
  /// Vive fuera de la pantalla a propósito: al iniciar sesión el router saca al
  /// usuario de `/sign-in` antes de que termine el `await`, y un `ref` de widget
  /// ya desmontado no puede loguear el evento. Es `keepAlive` porque un
  /// notifier autoDispose sin listeners se destruiría durante ese mismo `await`.
  ///
  /// El estado es el resultado del último inicio de sesión (null antes de
  /// cualquiera): la pantalla de edad lo lee para prellenar el nombre.
  SignInControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInControllerHash();

  @$internal
  @override
  SignInController create() => SignInController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInOutcome? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInOutcome?>(value),
    );
  }
}

String _$signInControllerHash() => r'fcad9b723c67c400d762c21eb1c4421a0d819b1b';

/// Runs the social sign-ins and logs `sign_in_completed`.
///
/// Vive fuera de la pantalla a propósito: al iniciar sesión el router saca al
/// usuario de `/sign-in` antes de que termine el `await`, y un `ref` de widget
/// ya desmontado no puede loguear el evento. Es `keepAlive` porque un
/// notifier autoDispose sin listeners se destruiría durante ese mismo `await`.
///
/// El estado es el resultado del último inicio de sesión (null antes de
/// cualquiera): la pantalla de edad lo lee para prellenar el nombre.

abstract class _$SignInController extends $Notifier<SignInOutcome?> {
  SignInOutcome? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SignInOutcome?, SignInOutcome?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignInOutcome?, SignInOutcome?>,
              SignInOutcome?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
