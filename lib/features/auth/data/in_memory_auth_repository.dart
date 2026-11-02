import 'dart:async';

import '../domain/auth_repository.dart';
import '../domain/auth_session.dart';
import '../domain/sign_in_outcome.dart';

/// [AuthRepository] that signs in a fixed fake account, for `USE_FIREBASE=false`.
final class InMemoryAuthRepository implements AuthRepository {
  /// Creates a repository with nobody signed in.
  InMemoryAuthRepository();

  /// Uid of the fake account every social sign-in returns.
  static const String fakeUid = 'in-memory-user';

  AuthSession _session = const AuthSession.signedOut();
  bool _hasSignedIn = false;
  final Set<StreamController<AuthSession>> _watchers =
      <StreamController<AuthSession>>{};

  @override
  Stream<AuthSession> watchSession() {
    late final StreamController<AuthSession> controller;
    controller = StreamController<AuthSession>(
      onListen: () {
        controller.add(_session);
        _watchers.add(controller);
      },
      onCancel: () {
        _watchers.remove(controller);
      },
    );
    return controller.stream;
  }

  @override
  Future<SignInOutcome> signInWithGoogle() async => _signIn(fakeUid);

  @override
  Future<SignInOutcome> signInWithApple() async => _signIn(fakeUid);

  @override
  Future<void> signInWithCustomToken(String token) async {
    _emit(const AuthSession.signedIn(uid: 'in-memory-minor'));
  }

  @override
  Future<void> signOut() async => _emit(const AuthSession.signedOut());

  @override
  Future<String> appleAuthorizationCode() async => 'in-memory-apple-code';

  @override
  Future<void> revokeApple(String authorizationCode) async {}

  @override
  Future<void> deleteCurrentAuthUser() async {
    _hasSignedIn = false;
    _emit(const AuthSession.signedOut());
  }

  SignInOutcome _signIn(String uid) {
    final bool isNewUser = !_hasSignedIn;
    _hasSignedIn = true;
    _emit(AuthSession.signedIn(uid: uid));
    return SignInOutcome(uid: uid, isNewUser: isNewUser);
  }

  void _emit(AuthSession session) {
    _session = session;
    for (final StreamController<AuthSession> watcher in _watchers) {
      watcher.add(session);
    }
  }
}
