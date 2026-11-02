import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/firebase/firebase_failure_mapper.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_session.dart';
import '../domain/sign_in_outcome.dart';

/// [AuthRepository] over Firebase Auth with Google and Apple as providers.
final class FirebaseAuthRepository implements AuthRepository {
  /// Creates the repository.
  ///
  /// [googleServerClientId] is the OAuth client id of the project's *web*
  /// client; empty means "take it from `google-services.json`" (Android).
  /// [appleServiceId] and [appleRedirectUri] are only needed for Sign in with
  /// Apple on Android; empty leaves it unconfigured there.
  FirebaseAuthRepository({
    required this._googleServerClientId,
    required this._appleServiceId,
    required this._appleRedirectUri,
    FirebaseAuth? auth,
  }) : _auth = auth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;
  final String _googleServerClientId;
  final String _appleServiceId;
  final String _appleRedirectUri;

  /// Initialization of the Google SDK, which must run exactly once before any
  /// other call. Null until the first Google sign-in.
  Future<void>? _googleInitialization;

  /// Provider id Firebase uses for Sign in with Apple.
  static const String _appleProviderId = 'apple.com';

  /// Characters allowed in the Apple nonce.
  static const String _nonceCharset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-._';

  static const int _nonceLength = 32;

  @override
  Stream<AuthSession> watchSession() {
    return _auth.authStateChanges().map(
      (User? user) => user == null
          ? const AuthSession.signedOut()
          : AuthSession.signedIn(uid: user.uid),
    );
  }

  @override
  Future<SignInOutcome> signInWithGoogle() async {
    try {
      await (_googleInitialization ??= _initializeGoogle());
      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate();
      // `google_sign_in` 7.x ya no expone `accessToken`: Firebase solo
      // necesita el idToken.
      final String? idToken = account.authentication.idToken;
      if (idToken == null) {
        throw const AppFailure.auth(message: 'Google returned no ID token');
      }
      return _signIn(
        GoogleAuthProvider.credential(idToken: idToken),
        displayName: _cleanName(account.displayName),
      );
    } on Object catch (error, stackTrace) {
      throw _mapError(error, stackTrace);
    }
  }

  @override
  Future<SignInOutcome> signInWithApple() async {
    try {
      final String rawNonce = _generateNonce();
      final AuthorizationCredentialAppleID apple =
          await SignInWithApple.getAppleIDCredential(
            scopes: <AppleIDAuthorizationScopes>[
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            webAuthenticationOptions: _appleWebOptions(),
            // Apple recibe el hash; Firebase recibe el nonce en claro y lo
            // compara con el que viene dentro del idToken.
            nonce: _sha256Hex(rawNonce),
          );
      final String? identityToken = apple.identityToken;
      if (identityToken == null) {
        throw const AppFailure.auth(
          message: 'Apple returned no identity token',
        );
      }
      return _signIn(
        OAuthProvider(
          _appleProviderId,
        ).credential(idToken: identityToken, rawNonce: rawNonce),
        // Apple manda el nombre una sola vez y puede venir vacío.
        displayName: _cleanName(
          <String?>[apple.givenName, apple.familyName].nonNulls.join(' '),
        ),
      );
    } on Object catch (error, stackTrace) {
      throw _mapError(error, stackTrace);
    }
  }

  @override
  Future<void> signInWithCustomToken(String token) async {
    try {
      await _auth.signInWithCustomToken(token);
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _signOutGoogle();
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }

  @override
  Future<String> appleAuthorizationCode() async {
    try {
      // Sin scopes: solo hace falta un código nuevo, no datos del usuario.
      final AuthorizationCredentialAppleID apple =
          await SignInWithApple.getAppleIDCredential(
            scopes: const <AppleIDAuthorizationScopes>[],
            webAuthenticationOptions: _appleWebOptions(),
          );
      return apple.authorizationCode;
    } on Object catch (error, stackTrace) {
      throw _mapError(error, stackTrace);
    }
  }

  @override
  Future<void> revokeApple(String authorizationCode) async {
    try {
      await _auth.revokeTokenWithAuthorizationCode(authorizationCode);
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }

  @override
  Future<void> deleteCurrentAuthUser() async {
    try {
      await _auth.currentUser?.delete();
      await _signOutGoogle();
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }

  Future<void> _initializeGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId: _googleServerClientId.isEmpty
            ? null
            : _googleServerClientId,
      );
    } on Object {
      // Si falla, el próximo intento vuelve a inicializar en vez de quedar con
      // un Future fallido para siempre.
      _googleInitialization = null;
      rethrow;
    }
  }

  /// Signs the Google SDK out so the next sign-in shows the account chooser.
  Future<void> _signOutGoogle() async {
    if (_googleInitialization != null) {
      await GoogleSignIn.instance.signOut();
    }
  }

  Future<SignInOutcome> _signIn(
    AuthCredential credential, {
    required String? displayName,
  }) async {
    final UserCredential result = await _auth.signInWithCredential(credential);
    final User? user = result.user;
    if (user == null) {
      throw const AppFailure.auth(message: 'Sign in returned no user');
    }
    return SignInOutcome(
      uid: user.uid,
      isNewUser: result.additionalUserInfo?.isNewUser ?? false,
      displayName: displayName,
    );
  }

  /// Options Apple needs on Android (Service ID and redirect URI); iOS ignores
  /// them. Null when they are not configured.
  WebAuthenticationOptions? _appleWebOptions() {
    if (_appleServiceId.isEmpty || _appleRedirectUri.isEmpty) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        // TODO(apple-android): Apple queda solo en iOS por decisión del usuario
        // (no es un olvido); rompe parcialmente el criterio de aceptación 1 de
        // la Fase 2 ("Google o Apple en las dos plataformas"). Para habilitarlo
        // en Android falta: (1) un endpoint de relevo en el servidor
        // (`WebAuthenticationOptions.redirectUri`) que redirija con un
        // `intent://callback?...#Intent;package=...;scheme=signinwithapple;end`
        // y (2) la activity `SignInWithAppleCallback` en AndroidManifest.xml
        // (ver sign_in_with_apple-8.2.0/README.md:178-199). Alternativa
        // descartada: `FirebaseAuth.signInWithProvider(AppleAuthProvider())`,
        // que no necesita endpoint. Mientras tanto se mantiene este error
        // controlado.
        throw const AppFailure.auth(
          message:
              'Sign in with Apple on Android needs APPLE_SERVICE_ID and '
              'APPLE_REDIRECT_URI',
        );
      }
      return null;
    }
    return WebAuthenticationOptions(
      clientId: _appleServiceId,
      redirectUri: Uri.parse(_appleRedirectUri),
    );
  }

  /// Name trimmed, or null when blank.
  static String? _cleanName(String? raw) {
    final String? name = raw?.trim();
    return name == null || name.isEmpty ? null : name;
  }

  static String _generateNonce() {
    final Random random = Random.secure();
    return List<String>.generate(
      _nonceLength,
      (int _) => _nonceCharset[random.nextInt(_nonceCharset.length)],
    ).join();
  }

  static String _sha256Hex(String input) =>
      sha256.convert(utf8.encode(input)).toString();

  /// Maps a cancellation from either SDK to [AppFailure.auth]; everything else
  /// goes through [mapFirebaseError].
  static AppFailure _mapError(Object error, StackTrace stackTrace) {
    if (error is AppFailure) {
      return error;
    }
    final bool canceled = switch (error) {
      GoogleSignInException(:final code) =>
        code == GoogleSignInExceptionCode.canceled ||
            code == GoogleSignInExceptionCode.interrupted,
      SignInWithAppleAuthorizationException(:final code) =>
        code == AuthorizationErrorCode.canceled,
      _ => false,
    };
    if (canceled) {
      return AppFailure.auth(
        message: 'Sign in was canceled',
        cause: error,
        stackTrace: stackTrace,
      );
    }
    return mapFirebaseError(error, stackTrace);
  }
}
