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

/// Families the signed-in person belongs to; empty while there is none.
///
/// Composición entre features, permitida solo acá (en
/// `presentation/*_providers.dart`): la lista depende de quién esté dentro.
///
/// Con el reintento por defecto de Riverpod, a diferencia de `currentUser`:
/// un *listen* de Firestore que falla no vuelve a emitir nunca más, así que
/// sin reintento la consulta queda muerta hasta reiniciar la app, aunque se
/// corrija la causa. Volver a suscribir es lo único que la revive.
@Riverpod(keepAlive: true)
Stream<List<Family>> currentFamilies(Ref ref) {
  final String? uid = ref.watch(currentUidProvider);
  if (uid == null) {
    return Stream<List<Family>>.value(const <Family>[]);
  }
  return ref.watch(familyRepositoryProvider).watchFamilies(uid);
}
