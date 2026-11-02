// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_gate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Current [RouterGate], derived from the session and the user document.
///
/// Síncrono a propósito: el `redirect` del router no puede esperar. Un error
/// de Auth equivale a "sin sesión" para que el usuario pueda reintentar. Un
/// error al leer el documento NO equivale a "no existe": mandarlo a la verja de
/// edad dejaría a un usuario existente en `/age`, donde `create` lo rechazan
/// las reglas. Va a [RouterGate.profileUnavailable], que muestra el mensaje
/// con reintento; si el stream sigue abierto, se recupera solo.
///
/// Todavía no hay repositorio de familias, así que [RouterGate.needsFamily] no
/// se produce: con perfil, el resultado es [RouterGate.ready].

@ProviderFor(routerGate)
final routerGateProvider = RouterGateProvider._();

/// Current [RouterGate], derived from the session and the user document.
///
/// Síncrono a propósito: el `redirect` del router no puede esperar. Un error
/// de Auth equivale a "sin sesión" para que el usuario pueda reintentar. Un
/// error al leer el documento NO equivale a "no existe": mandarlo a la verja de
/// edad dejaría a un usuario existente en `/age`, donde `create` lo rechazan
/// las reglas. Va a [RouterGate.profileUnavailable], que muestra el mensaje
/// con reintento; si el stream sigue abierto, se recupera solo.
///
/// Todavía no hay repositorio de familias, así que [RouterGate.needsFamily] no
/// se produce: con perfil, el resultado es [RouterGate.ready].

final class RouterGateProvider
    extends $FunctionalProvider<RouterGate, RouterGate, RouterGate>
    with $Provider<RouterGate> {
  /// Current [RouterGate], derived from the session and the user document.
  ///
  /// Síncrono a propósito: el `redirect` del router no puede esperar. Un error
  /// de Auth equivale a "sin sesión" para que el usuario pueda reintentar. Un
  /// error al leer el documento NO equivale a "no existe": mandarlo a la verja de
  /// edad dejaría a un usuario existente en `/age`, donde `create` lo rechazan
  /// las reglas. Va a [RouterGate.profileUnavailable], que muestra el mensaje
  /// con reintento; si el stream sigue abierto, se recupera solo.
  ///
  /// Todavía no hay repositorio de familias, así que [RouterGate.needsFamily] no
  /// se produce: con perfil, el resultado es [RouterGate.ready].
  RouterGateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerGateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerGateHash();

  @$internal
  @override
  $ProviderElement<RouterGate> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouterGate create(Ref ref) {
    return routerGate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouterGate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouterGate>(value),
    );
  }
}

String _$routerGateHash() => r'd99e46878722b9ad27dcb4064e0d19740148b401';
