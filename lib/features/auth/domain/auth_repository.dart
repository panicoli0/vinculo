import 'auth_session.dart';
import 'sign_in_outcome.dart';

/// Authentication of the person using the app.
///
/// Todo fallo llega como `AppFailure`; ningún error del SDK sale de `data/`.
abstract interface class AuthRepository {
  /// Emits the current session on listen and again on every sign-in or
  /// sign-out.
  Stream<AuthSession> watchSession();

  /// Signs in with a Google account.
  Future<SignInOutcome> signInWithGoogle();

  /// Signs in with Sign in with Apple.
  Future<SignInOutcome> signInWithApple();

  /// Signs in with a custom token issued by a Cloud Function (minor code).
  Future<void> signInWithCustomToken(String token);

  /// Signs out of the current account.
  Future<void> signOut();

  /// Asks Apple for a fresh authorization code, needed to revoke the token
  /// before deleting the account.
  Future<String> appleAuthorizationCode();

  /// Revokes the Sign in with Apple token behind [authorizationCode].
  Future<void> revokeApple(String authorizationCode);

  /// Deletes the Auth user that just signed in.
  ///
  /// Solo para el rechazo por edad: el resto de los borrados pasa por la
  /// Function `deleteAccount`.
  Future<void> deleteCurrentAuthUser();
}
