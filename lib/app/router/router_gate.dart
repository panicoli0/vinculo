import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/app_user.dart';
import '../../features/auth/domain/auth_session.dart';
import '../../features/auth/presentation/auth_providers.dart';
import '../../features/family/domain/family.dart';
import '../../features/family/presentation/family_providers.dart';

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

/// Current [RouterGate], derived from the session, the user document and the
/// families the person belongs to.
///
/// Síncrono a propósito: el `redirect` del router no puede esperar. Un error
/// de Auth equivale a "sin sesión" para que el usuario pueda reintentar. Un
/// error al leer el documento NO equivale a "no existe": mandarlo a la verja de
/// edad dejaría a un usuario existente en `/age`, donde `create` lo rechazan
/// las reglas. Va a [RouterGate.profileUnavailable], que muestra el mensaje
/// con reintento; si el stream sigue abierto, se recupera solo.
@Riverpod(keepAlive: true)
RouterGate routerGate(Ref ref) {
  final AsyncValue<AuthSession> session = ref.watch(authSessionProvider);
  return switch (session.value) {
    null => session.hasError ? RouterGate.signedOut : RouterGate.loading,
    SignedOutSession() => RouterGate.signedOut,
    SignedInSession() => _profileGate(ref),
  };
}

RouterGate _profileGate(Ref ref) {
  final AsyncValue<AppUser?> user = ref.watch(currentUserProvider);
  if (user.isLoading) {
    return RouterGate.loading;
  }
  if (user.hasError) {
    return RouterGate.profileUnavailable;
  }
  if (user.value == null) {
    return RouterGate.needsProfile;
  }
  return _familyGate(ref.watch(currentFamiliesProvider));
}

/// Where the family list leaves a person who already has a profile.
///
/// Una lista vacía es "todavía no tiene familia". Un error NO lo es: mandarlo
/// a `/family/new` lo dejaría creando una segunda familia encima de la que ya
/// tiene. Va a [RouterGate.profileUnavailable], que es la pantalla de "no
/// pudimos cargar tu estado" con reintento y salida. Quien revive la consulta
/// es el reintento del propio `currentFamilies`, no el botón de esa pantalla.
///
/// TODO(fase-2-family-message): esa pantalla lee el mensaje de error solo de
/// `currentUser`, así que un fallo de familias se muestra con el texto
/// genérico. Tiene que pasar a leer ambos lados cuando se arme el resto de la
/// Fase 2.
RouterGate _familyGate(AsyncValue<List<Family>> families) {
  if (families.isLoading) {
    return RouterGate.loading;
  }
  if (families.hasError) {
    return RouterGate.profileUnavailable;
  }
  final List<Family> joined = families.value ?? const <Family>[];
  return joined.isEmpty ? RouterGate.needsFamily : RouterGate.ready;
}
