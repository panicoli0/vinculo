import '../../../core/firebase/timestamp_converter.dart';
import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../family/domain/consent_status.dart';
import '../../family/domain/joined_via.dart';
import '../../family/domain/parental_verification_method.dart';
import '../../preferences/domain/ui_locale_option.dart';
import '../domain/account_type.dart';
import '../domain/app_user.dart';
import '../domain/joined_via_info.dart';
import '../domain/minor_consent.dart';

/// Field names of the `users/{uid}` document (data_model §2).
///
/// Son un contrato con `firestore.rules`: un error de tipeo rompe la escritura
/// o pierde el dato en silencio.
enum UserField {
  /// Adult or minor.
  accountType('accountType'),

  /// Name shown to the family.
  displayName('displayName'),

  /// Year of birth.
  birthYear('birthYear'),

  /// Interface language choice.
  uiLocale('uiLocale'),

  /// How card text is shown.
  cardLanguageMode('cardLanguageMode'),

  /// Language shown large in bilingual mode.
  primaryLanguage('primaryLanguage'),

  /// Creation instant.
  createdAt('createdAt'),

  /// Parental consent record.
  consent('consent'),

  /// How the person joined the family.
  joinedVia('joinedVia'),

  /// First answered question instant.
  firstAnsweredAt('firstAnsweredAt'),

  /// Subscription fake door first shown instant.
  fakeDoorSeenAt('fakeDoorSeenAt');

  const UserField(this.key);

  /// Key of the field inside the document.
  final String key;
}

/// Builds an [AppUser] from the raw `users/{uid}` document [data].
///
/// `json_serializable` no se usa a propósito: el `domain/` no puede importar
/// el converter de Timestamp (depende de Firestore), así que la lectura vive
/// acá. Un documento mal formado lanza [FormatException]; nunca se rellena con
/// valores inventados.
AppUser appUserFromData(String uid, Map<String, Object?> data) {
  return AppUser(
    uid: uid,
    accountType: _enumField(AccountType.values, data, UserField.accountType),
    displayName: _stringField(data, UserField.displayName),
    birthYear: _intField(data, UserField.birthYear),
    uiLocale: _enumField(UiLocaleOption.values, data, UserField.uiLocale),
    cardLanguageMode: _enumField(
      CardLanguageMode.values,
      data,
      UserField.cardLanguageMode,
    ),
    primaryLanguage: _enumField(
      CardLanguage.values,
      data,
      UserField.primaryLanguage,
    ),
    createdAt: const NullableTimestampConverter().fromJson(
      data[UserField.createdAt.key],
    ),
    consent: _consent(_mapField(data, UserField.consent)),
    joinedVia: _joinedVia(_mapField(data, UserField.joinedVia)),
    firstAnsweredAt: const NullableTimestampConverter().fromJson(
      data[UserField.firstAnsweredAt.key],
    ),
    fakeDoorSeenAt: const NullableTimestampConverter().fromJson(
      data[UserField.fakeDoorSeenAt.key],
    ),
  );
}

MinorConsent? _consent(Map<String, Object?>? map) {
  if (map == null) {
    return null;
  }
  return MinorConsent(
    status: _enumKey(ConsentStatus.values, map, 'status'),
    guardianUid: _stringKey(map, 'guardianUid'),
    method: _enumKey(ParentalVerificationMethod.values, map, 'method'),
    noticeVersion: _stringKey(map, 'noticeVersion'),
    at: const TimestampConverter().fromJson(map['at']),
  );
}

JoinedViaInfo? _joinedVia(Map<String, Object?>? map) {
  if (map == null) {
    return null;
  }
  return JoinedViaInfo(
    kind: _enumKey(JoinedVia.values, map, 'kind'),
    inviteRef: _stringKey(map, 'inviteRef'),
    inviteCreatedAt: const TimestampConverter().fromJson(
      map['inviteCreatedAt'],
    ),
    at: const TimestampConverter().fromJson(map['at']),
  );
}

Map<String, Object?>? _mapField(Map<String, Object?> data, UserField field) =>
    switch (data[field.key]) {
      null => null,
      final Map<String, Object?> map => map,
      final Object other => throw FormatException(
        'Expected a map in ${field.key}, got: $other',
      ),
    };

String _stringField(Map<String, Object?> data, UserField field) =>
    _stringKey(data, field.key);

int _intField(Map<String, Object?> data, UserField field) =>
    switch (data[field.key]) {
      final int value => value,
      final Object? other => throw FormatException(
        'Expected an int in ${field.key}, got: $other',
      ),
    };

T _enumField<T extends Enum>(
  List<T> values,
  Map<String, Object?> data,
  UserField field,
) => _enumKey(values, data, field.key);

String _stringKey(Map<String, Object?> map, String key) => switch (map[key]) {
  final String value => value,
  final Object? other => throw FormatException(
    'Expected a string in $key, got: $other',
  ),
};

T _enumKey<T extends Enum>(
  List<T> values,
  Map<String, Object?> map,
  String key,
) {
  final Object? raw = map[key];
  final T? match = raw is String ? values.asNameMap()[raw] : null;
  if (match == null) {
    throw FormatException('Unknown value in $key: $raw');
  }
  return match;
}
