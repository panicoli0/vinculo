/// Kind of account being deleted.
enum AccountDeletionType {
  /// An adult deleting their own account.
  adult,

  /// A minor profile deleted by its guardian.
  minorByGuardian,
}
