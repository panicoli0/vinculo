import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/presentation/auth_providers.dart';
import '../domain/family.dart';
import '../domain/family_repository.dart';

part 'family_providers.g.dart';

/// The [FamilyRepository]; must be overridden in bootstrap.
@Riverpod(keepAlive: true)
FamilyRepository familyRepository(Ref ref) => throw UnimplementedError(
  'familyRepositoryProvider must be overridden in bootstrap',
);

/// Retry policy of [currentFamilies]: never.
///
/// Mismo motivo que en `currentUser`: el reintento de Riverpod volvería a
/// suscribir la consulta y dejaría el estado en `loading` unos 40 s antes de
/// mostrar el error, cuando el stream de Firestore ya se recupera solo.
Duration? _neverRetry(int retryCount, Object error) => null;

/// Families the signed-in person belongs to; empty while there is none.
///
/// Composición entre features, permitida solo acá (en
/// `presentation/*_providers.dart`): la lista depende de quién esté dentro.
@Riverpod(keepAlive: true, retry: _neverRetry)
Stream<List<Family>> currentFamilies(Ref ref) {
  final String? uid = ref.watch(currentUidProvider);
  if (uid == null) {
    return Stream<List<Family>>.value(const <Family>[]);
  }
  return ref.watch(familyRepositoryProvider).watchFamilies(uid);
}
