// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The app's [GoRouter]: a four-tab shell plus root-level stacked routes.
///
/// Bienvenida, ingreso y edad son reales; el resto son placeholders hasta las
/// fases 2 a 5. El `redirect` lee el [RouterGate] con `ref.read` y se vuelve a
/// ejecutar por el `refreshListenable`: si observara el gate, el router se
/// recrearía en cada cambio de sesión y perdería la pila de navegación.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// The app's [GoRouter]: a four-tab shell plus root-level stacked routes.
///
/// Bienvenida, ingreso y edad son reales; el resto son placeholders hasta las
/// fases 2 a 5. El `redirect` lee el [RouterGate] con `ref.read` y se vuelve a
/// ejecutar por el `refreshListenable`: si observara el gate, el router se
/// recrearía en cada cambio de sesión y perdería la pila de navegación.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// The app's [GoRouter]: a four-tab shell plus root-level stacked routes.
  ///
  /// Bienvenida, ingreso y edad son reales; el resto son placeholders hasta las
  /// fases 2 a 5. El `redirect` lee el [RouterGate] con `ref.read` y se vuelve a
  /// ejecutar por el `refreshListenable`: si observara el gate, el router se
  /// recrearía en cada cambio de sesión y perdería la pila de navegación.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'f4d53e81ec47562f44cd158cade970209457bd0f';
