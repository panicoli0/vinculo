/// How the user signed in.
enum SignInMethod {
  /// Google account.
  google,

  /// Sign in with Apple.
  apple,

  /// One-time guardian-issued code (minor profile).
  code,
}
