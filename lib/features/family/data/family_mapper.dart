import '../../../core/firebase/timestamp_converter.dart';
import '../domain/family.dart';
import '../domain/family_plan.dart';

/// Field names of the `families/{familyId}` document (data_model §3).
///
/// Son un contrato con `firestore.rules`: un error de tipeo rompe la escritura
/// o pierde el dato en silencio.
enum FamilyField {
  /// Name the family chose.
  name('name'),

  /// Uid of the adult who created it.
  ownerUid('ownerUid'),

  /// Uids of every member.
  memberUids('memberUids'),

  /// Plan the family is on.
  plan('plan'),

  /// Creation instant.
  createdAt('createdAt'),

  /// Pseudonym used as `family_ref` in analytics.
  analyticsRef('analyticsRef');

  const FamilyField(this.key);

  /// Name of the field in Firestore.
  final String key;
}

/// Field names of the `families/{familyId}/members/{uid}` document
/// (data_model §3).
enum FamilyMemberField {
  /// Copy of `users.displayName`, visible to the whole family.
  displayName('displayName'),

  /// Adult or minor.
  accountType('accountType'),

  /// Role inside the family.
  role('role'),

  /// Instant the person joined.
  joinedAt('joinedAt');

  const FamilyMemberField(this.key);

  /// Name of the field in Firestore.
  final String key;
}

/// Builds a [Family] with id [id] out of its Firestore [data].
///
/// Un documento al que le falta un campo, o que trae un plan desconocido, es
/// un documento corrupto: falla con [FormatException] en vez de inventar un
/// valor. `createdAt` es la excepción y puede faltar, porque el
/// `serverTimestamp()` todavía no llegó en el snapshot local de la escritura.
Family familyFromData(String id, Map<String, dynamic> data) {
  return Family(
    id: id,
    name: _string(data, FamilyField.name),
    ownerUid: _string(data, FamilyField.ownerUid),
    memberUids: _memberUids(data),
    plan: _plan(data),
    analyticsRef: _string(data, FamilyField.analyticsRef),
    createdAt: const NullableTimestampConverter().fromJson(
      data[FamilyField.createdAt.key],
    ),
  );
}

String _string(Map<String, dynamic> data, FamilyField field) {
  final Object? value = data[field.key];
  if (value is String) {
    return value;
  }
  throw FormatException('families.${field.key}: expected a String, got $value');
}

List<String> _memberUids(Map<String, dynamic> data) {
  final Object? value = data[FamilyField.memberUids.key];
  if (value is List && value.every((Object? uid) => uid is String)) {
    return List<String>.unmodifiable(value);
  }
  throw FormatException(
    'families.${FamilyField.memberUids.key}: expected a list of String, '
    'got $value',
  );
}

FamilyPlan _plan(Map<String, dynamic> data) {
  final Object? value = data[FamilyField.plan.key];
  for (final FamilyPlan plan in FamilyPlan.values) {
    if (plan.name == value) {
      return plan;
    }
  }
  throw FormatException(
    'families.${FamilyField.plan.key}: unknown plan $value',
  );
}
