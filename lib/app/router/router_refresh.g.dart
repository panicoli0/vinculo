// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_refresh.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifies the router each time the [RouterGate] changes, so it re-runs its
/// `redirect`.
///
/// El estado de sesión cambia de forma asíncrona (Rootsy no tenía este caso).
/// Nunca reconstruye el provider: si lo hiciera, `appRouter` se recrearía y se
/// perdería la pila de navegación.

@ProviderFor(routerRefresh)
final routerRefreshProvider = RouterRefreshProvider._();

/// Notifies the router each time the [RouterGate] changes, so it re-runs its
/// `redirect`.
///
/// El estado de sesión cambia de forma asíncrona (Rootsy no tenía este caso).
/// Nunca reconstruye el provider: si lo hiciera, `appRouter` se recrearía y se
/// perdería la pila de navegación.

final class RouterRefreshProvider
    extends $FunctionalProvider<Listenable, Listenable, Listenable>
    with $Provider<Listenable> {
  /// Notifies the router each time the [RouterGate] changes, so it re-runs its
  /// `redirect`.
  ///
  /// El estado de sesión cambia de forma asíncrona (Rootsy no tenía este caso).
  /// Nunca reconstruye el provider: si lo hiciera, `appRouter` se recrearía y se
  /// perdería la pila de navegación.
  RouterRefreshProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerRefreshProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerRefreshHash();

  @$internal
  @override
  $ProviderElement<Listenable> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Listenable create(Ref ref) {
    return routerRefresh(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Listenable value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Listenable>(value),
    );
  }
}

String _$routerRefreshHash() => r'172b7afe7399954cecdff830007516c2aa437a67';
