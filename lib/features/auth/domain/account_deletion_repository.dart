/// Deletion of the signed-in person's account and data.
abstract interface class AccountDeletionRepository {
  /// Deletes the account in cascade through the `deleteAccount` Function.
  Future<void> deleteAccount();
}
