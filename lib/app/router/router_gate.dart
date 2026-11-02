import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/app_user.dart';
import '../../features/auth/domain/auth_session.dart';
import '../../features/auth/presentation/auth_providers.dart';

part 'router_gate.g.dart';

/// Which part of the app the signed-in state allows (spec §4).
enum RouterGate {
  /// Auth, or the user document, has not answered yet.
  loading,

  /// Nobody is signed in.
  signedOut,

  /// Signed in, but whether `users/{uid}` exists is unknown (offline with no
  /// cached copy, or the read failed): shows a message with a retry.
  profileUnavailable,

  /// Signed in without a `users/{uid}` document: must pass the age gate.
  needsProfile,

  /// Has a profile but belongs to no family yet.
  needsFamily,

  /// Fully set up.
  ready,
}

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
@Riverpod(keepAlive: true)
RouterGate routerGate(Ref ref) {
  final AsyncValue<AuthSession> session = ref.watch(authSessionProvider);
  return switch (session.value) {
    null => session.hasError ? RouterGate.signedOut : RouterGate.loading,
    SignedOutSession() => RouterGate.signedOut,
    SignedInSession() => _profileGate(ref.watch(currentUserProvider)),
  };
}

RouterGate _profileGate(AsyncValue<AppUser?> user) {
  if (user.isLoading) {
    return RouterGate.loading;
  }
  if (user.hasError) {
    return RouterGate.profileUnavailable;
  }
  return user.value == null ? RouterGate.needsProfile : RouterGate.ready;
}
