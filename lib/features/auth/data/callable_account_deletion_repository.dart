import '../../../core/firebase/firebase_bootstrap.dart';
import '../../../core/firebase/firebase_failure_mapper.dart';
import '../domain/account_deletion_repository.dart';

/// [AccountDeletionRepository] backed by the `deleteAccount` callable.
final class CallableAccountDeletionRepository
    implements AccountDeletionRepository {
  /// Creates the repository.
  const CallableAccountDeletionRepository();

  /// Name of the Cloud Function (data_model §6).
  static const String _functionName = 'deleteAccount';

  @override
  Future<void> deleteAccount() async {
    try {
      // Siempre por `vinculoFunctions`: `FirebaseFunctions.instance` apunta a
      // us-central1 y se saltearía el emulador.
      await vinculoFunctions.httpsCallable(_functionName).call<Object?>();
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }
}
