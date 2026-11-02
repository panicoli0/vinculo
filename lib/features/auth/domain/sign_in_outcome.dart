import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_outcome.freezed.dart';

/// Result of a successful social sign-in.
@freezed
abstract class SignInOutcome with _$SignInOutcome {
  /// Creates an outcome; [isNewUser] feeds the `sign_in_completed` event.
  const factory SignInOutcome({
    /// Firebase Auth uid of the account that signed in.
    required String uid,

    /// Whether the Auth account was created by this sign-in.
    required bool isNewUser,

    /// Name the identity provider reported, or null when it reported none
    /// (Apple only sends it the first time). Only prefills the age screen.
    String? displayName,
  }) = _SignInOutcome;
}
