import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session.freezed.dart';

/// Whether somebody is signed in on this device.
@freezed
sealed class AuthSession with _$AuthSession {
  /// Nobody is signed in.
  const factory AuthSession.signedOut() = SignedOutSession;

  /// The account identified by [uid] is signed in.
  const factory AuthSession.signedIn({
    /// Firebase Auth uid of the signed-in account.
    required String uid,
  }) = SignedInSession;
}
