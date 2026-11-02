/// Kind of account stored in `users/{uid}.accountType`.
///
/// Los valores guardados son `name` (data_model §3).
enum AccountType {
  /// Adult with their own social sign-in; created by the client.
  adult,

  /// Minor profile created by a guardian through a Cloud Function.
  minor,
}
