import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/firebase/firebase_failure_mapper.dart';
import '../../auth/domain/account_type.dart';
import '../domain/family.dart';
import '../domain/family_plan.dart';
import '../domain/family_repository.dart';
import '../domain/member_role.dart';
import 'family_mapper.dart';

/// [FamilyRepository] over the `families` collection of Firestore.
final class FirestoreFamilyRepository implements FamilyRepository {
  /// Creates a repository over [firestore], or the default instance, drawing
  /// analytics pseudonyms from [uuid].
  FirestoreFamilyRepository({FirebaseFirestore? firestore, Uuid? uuid})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _uuid = uuid ?? const Uuid();

  final FirebaseFirestore _firestore;
  final Uuid _uuid;

  static const String _collection = 'families';
  static const String _membersCollection = 'members';

  CollectionReference<Map<String, dynamic>> get _families =>
      _firestore.collection(_collection);

  @override
  Stream<List<Family>> watchFamilies(String uid) {
    // Con metadata, igual que `users/{uid}`: una consulta sin red y sin caché
    // devuelve cero documentos, y tomar esa lista vacía por "todavía no tiene
    // familia" mandaría a un miembro existente a crear una SEGUNDA familia.
    // Vacío + `isFromCache` se informa como [AppFailure.network] y el stream
    // sigue abierto: el snapshot del servidor lo reemplaza al volver la red.
    return _families
        .where(FamilyField.memberUids.key, arrayContains: uid)
        .snapshots(includeMetadataChanges: true)
        .transform(
          StreamTransformer<
            QuerySnapshot<Map<String, dynamic>>,
            List<Family>
          >.fromHandlers(
            handleData: _forward,
            handleError: (error, stackTrace, sink) =>
                sink.addError(mapFirebaseError(error, stackTrace), stackTrace),
          ),
        );
  }

  /// Turns one [snapshot] into the list of families, or a failure on [sink].
  ///
  /// Una lista vacía que vino del caché no prueba nada: puede ser alguien sin
  /// familia o un miembro cuya familia nunca se cacheó. Solo el servidor
  /// puede afirmar la ausencia.
  void _forward(
    QuerySnapshot<Map<String, dynamic>> snapshot,
    EventSink<List<Family>> sink,
  ) {
    try {
      if (snapshot.docs.isEmpty && snapshot.metadata.isFromCache) {
        sink.addError(
          const AppFailure.network(
            message: 'families query is not cached and there is no connection',
          ),
        );
        return;
      }
      sink.add(<Family>[
        for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
            in snapshot.docs)
          familyFromData(doc.id, doc.data()),
      ]);
    } on Object catch (error, stackTrace) {
      sink.addError(mapFirebaseError(error, stackTrace), stackTrace);
    }
  }

  @override
  Future<Family> createFamily({
    required String name,
    required String ownerUid,
    required String ownerDisplayName,
  }) async {
    final DocumentReference<Map<String, dynamic>> family = _families.doc();
    final String analyticsRef = _uuid.v4();

    // Un solo lote: la regla de `families` exige con `getAfter` que
    // `members/{ownerUid}` exista al terminar la operación. Escribirlos por
    // separado no solo dejaría un estado intermedio inválido — lo rechazarían
    // las reglas.
    final WriteBatch batch = _firestore.batch()
      // Mapa cerrado: la regla de `create` solo acepta estas seis claves.
      ..set(family, <String, Object?>{
        FamilyField.name.key: name,
        FamilyField.ownerUid.key: ownerUid,
        FamilyField.memberUids.key: <String>[ownerUid],
        FamilyField.plan.key: FamilyPlan.beta.name,
        FamilyField.analyticsRef.key: analyticsRef,
        FamilyField.createdAt.key: FieldValue.serverTimestamp(),
      })
      ..set(
        family.collection(_membersCollection).doc(ownerUid),
        <String, Object?>{
          FamilyMemberField.displayName.key: ownerDisplayName,
          FamilyMemberField.accountType.key: AccountType.adult.name,
          FamilyMemberField.role.key: MemberRole.owner.name,
          FamilyMemberField.joinedAt.key: FieldValue.serverTimestamp(),
        },
      );

    try {
      await batch.commit();
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }

    // `createdAt` queda en null a propósito: lo resuelve el servidor y llega
    // con el snapshot de `watchFamilies`, no con esta respuesta.
    return Family(
      id: family.id,
      name: name,
      ownerUid: ownerUid,
      memberUids: List<String>.unmodifiable(<String>[ownerUid]),
      plan: FamilyPlan.beta,
      analyticsRef: analyticsRef,
    );
  }
}
