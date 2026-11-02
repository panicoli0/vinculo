import 'package:freezed_annotation/freezed_annotation.dart';

import 'family_plan.dart';

part 'family.freezed.dart';

/// A family: the group every bond, question and story hangs from
/// (data_model §3).
///
/// Lo que la familia ve de cada persona NO vive acá, sino en
/// `families/{id}/members/{uid}`: este documento solo tiene lo del grupo.
@freezed
abstract class Family with _$Family {
  /// Creates a family.
  const factory Family({
    /// Firestore document id; no es un campo almacenado.
    required String id,

    /// Name the family chose, 1 to 40 characters.
    required String name,

    /// Uid of the adult who created it, and who pays once billing exists.
    required String ownerUid,

    /// Uids of every member, for `array-contains` queries.
    ///
    /// Solo el cliente lo escribe al crear la familia, y únicamente con su
    /// propio uid; después lo mantienen las Functions.
    required List<String> memberUids,

    /// Plan the family is on.
    required FamilyPlan plan,

    /// Pseudonymous random id used as `family_ref` in analytics.
    ///
    /// Es lo único de la familia que puede salir del teléfono: nunca el id
    /// del documento, que es una referencia real de Firestore.
    required String analyticsRef,

    /// Creation instant, or null while the server timestamp has not landed.
    ///
    /// Un snapshot local posterior a `set()` todavía trae `null` acá; no se
    /// resuelve con la hora del teléfono porque el día 28 del fake door se
    /// cuenta desde la fecha del servidor.
    DateTime? createdAt,
  }) = _Family;
}
