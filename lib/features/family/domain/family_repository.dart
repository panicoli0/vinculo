import 'family.dart';

/// Access to the `families` collection.
abstract interface class FamilyRepository {
  /// Emits the families [uid] belongs to; empty while there is none.
  ///
  /// En la beta una persona pertenece a una sola familia, pero la consulta
  /// devuelve una lista: el modelo de datos no lo impide y un segundo
  /// documento tiene que verse, no desaparecer.
  Stream<List<Family>> watchFamilies(String uid);

  /// Creates a family named [name] owned by [ownerUid], plus the owner's own
  /// `members/{uid}` document, and returns it.
  ///
  /// Las dos escrituras van en el mismo lote: la regla de `families` exige
  /// (con `getAfter`) que el miembro owner exista al terminar, así que una
  /// familia sin su miembro no es un estado alcanzable.
  Future<Family> createFamily({
    required String name,
    required String ownerUid,
    required String ownerDisplayName,
  });
}
