import '../domain/account_deletion_repository.dart';

/// [AccountDeletionRepository] that does nothing, for `USE_FIREBASE=false`.
final class InMemoryAccountDeletionRepository
    implements AccountDeletionRepository {
  /// Creates the repository.
  const InMemoryAccountDeletionRepository();

  @override
  Future<void> deleteAccount() async {}
}
