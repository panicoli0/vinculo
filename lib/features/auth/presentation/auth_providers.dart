import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/account_deletion_repository.dart';
import '../domain/app_user.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_session.dart';
import '../domain/user_repository.dart';

part 'auth_providers.g.dart';

/// The [AuthRepository]; must be overridden in bootstrap.
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => throw UnimplementedError(
  'authRepositoryProvider must be overridden in bootstrap',
);

/// The [UserRepository]; must be overridden in bootstrap.
@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) => throw UnimplementedError(
  'userRepositoryProvider must be overridden in bootstrap',
);

/// The [AccountDeletionRepository]; must be overridden in bootstrap.
@Riverpod(keepAlive: true)
AccountDeletionRepository accountDeletionRepository(Ref ref) =>
    throw UnimplementedError(
      'accountDeletionRepositoryProvider must be overridden in bootstrap',
    );

/// Whether somebody is signed in; loading until Auth reports its first state.
@Riverpod(keepAlive: true)
Stream<AuthSession> authSession(Ref ref) =>
    ref.watch(authRepositoryProvider).watchSession();

/// Uid of the signed-in account, or null when nobody is signed in (or Auth has
/// not answered yet).
@Riverpod(keepAlive: true)
String? currentUid(Ref ref) => switch (ref.watch(authSessionProvider).value) {
  SignedInSession(:final uid) => uid,
  SignedOutSession() || null => null,
};

/// Retry policy of [currentUser]: never.
///
/// El reintento automático de Riverpod volvería a suscribir el stream y
/// mantendría el estado en `loading` unos 40 s antes de mostrar el error; acá
/// el stream sigue abierto tras un error y se recupera solo cuando vuelve la
/// red, y el reintento explícito es el botón de la pantalla de perfil no
/// disponible.
Duration? _neverRetry(int retryCount, Object error) => null;

/// The `users/{uid}` document of the signed-in account; null data means there
/// is no document yet, or nobody is signed in.
///
/// Emite un error (sin cerrar el stream) cuando no se puede saber si el
/// documento existe, p. ej. sin red y sin caché; un snapshot posterior lo
/// reemplaza.
@Riverpod(keepAlive: true, retry: _neverRetry)
Stream<AppUser?> currentUser(Ref ref) {
  final String? uid = ref.watch(currentUidProvider);
  if (uid == null) {
    return Stream<AppUser?>.value(null);
  }
  return ref.watch(userRepositoryProvider).watchUser(uid);
}

/// Whether the signed-in account is a minor profile.
@Riverpod(keepAlive: true)
bool isMinor(Ref ref) => ref.watch(currentUserProvider).value?.isMinor ?? false;
