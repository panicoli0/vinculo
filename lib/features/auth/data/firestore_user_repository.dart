import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/firebase/firebase_failure_mapper.dart';
import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../preferences/domain/ui_locale_option.dart';
import '../domain/account_type.dart';
import '../domain/app_user.dart';
import '../domain/display_name_policy.dart';
import '../domain/user_repository.dart';
import 'app_user_mapper.dart';

/// [UserRepository] over the `users` collection of Firestore.
final class FirestoreUserRepository implements UserRepository {
  /// Creates a repository over [firestore], or the default instance.
  FirestoreUserRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const String _collection = 'users';

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _firestore.collection(_collection).doc(uid);

  @override
  Stream<AppUser?> watchUser(String uid) {
    // Con metadata para distinguir "no existe" de "no está en el caché
    // todavía": sin red y sin caché Firestore emite un documento vacío que
    // vendría de caché, y tratarlo como ausente mandaría a un usuario que ya
    // existe de vuelta a la pantalla de edad. Ese caso se informa como
    // [AppFailure.network] y el stream sigue abierto: cuando vuelve la red
    // llega el snapshot del servidor (`isFromCache == false`) y reemplaza al
    // error. Un `async*` terminaría en el primer error y no se recuperaría.
    return _doc(uid)
        .snapshots(includeMetadataChanges: true)
        .transform(
          StreamTransformer<
            DocumentSnapshot<Map<String, dynamic>>,
            AppUser?
          >.fromHandlers(
            handleData: (snapshot, sink) => _forward(uid, snapshot, sink),
            handleError: (error, stackTrace, sink) =>
                sink.addError(mapFirebaseError(error, stackTrace), stackTrace),
          ),
        );
  }

  /// Turns one [snapshot] into a user, an absence or a failure on [sink].
  void _forward(
    String uid,
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    EventSink<AppUser?> sink,
  ) {
    try {
      final Map<String, dynamic>? data = snapshot.data();
      if (data != null) {
        sink.add(appUserFromData(uid, data));
      } else if (snapshot.metadata.isFromCache) {
        sink.addError(
          const AppFailure.network(
            message: 'users document is not cached and there is no connection',
          ),
        );
      } else {
        sink.add(null);
      }
    } on Object catch (error, stackTrace) {
      sink.addError(mapFirebaseError(error, stackTrace), stackTrace);
    }
  }

  @override
  Future<void> createAdult({
    required String uid,
    required String displayName,
    required int birthYear,
    required UiLocaleOption uiLocale,
    required CardLanguageMode cardLanguageMode,
    required CardLanguage primaryLanguage,
  }) {
    // Mismo contrato que `updateProfile`: el nombre se guarda tal cual, y la
    // regla acota el valor crudo. Hoy el llamador ya pasa `.trim()`, pero el
    // assert lo documenta y lo atrapa.
    assert(
      isValidDisplayName(displayName) &&
          displayName.length <= kDisplayNameMaxUtf16Units,
      'displayName must be the stored value: valid and at most '
      '$kDisplayNameMaxUtf16Units UTF-16 units raw',
    );
    // Mapa cerrado: la regla de `create` solo acepta estas siete claves.
    return _write(
      () => _doc(uid).set(<String, Object?>{
        UserField.accountType.key: AccountType.adult.name,
        UserField.displayName.key: displayName,
        UserField.birthYear.key: birthYear,
        UserField.uiLocale.key: uiLocale.name,
        UserField.cardLanguageMode.key: cardLanguageMode.name,
        UserField.primaryLanguage.key: primaryLanguage.name,
        UserField.createdAt.key: FieldValue.serverTimestamp(),
      }),
    );
  }

  @override
  Future<void> updateProfile({
    required String uid,
    String? displayName,
    UiLocaleOption? uiLocale,
  }) {
    // El contrato de `UserRepository.updateProfile` exige el valor a guardar;
    // la regla de Firestore acota el crudo, no el trimeado, así que
    // `isValidDisplayName` sola no alcanza.
    assert(
      displayName == null ||
          (isValidDisplayName(displayName) &&
              displayName.length <= kDisplayNameMaxUtf16Units),
      'displayName must be the stored value: valid and at most '
      '$kDisplayNameMaxUtf16Units UTF-16 units raw',
    );
    return _update(uid, <String, Object?>{
      UserField.displayName.key: ?displayName,
      UserField.uiLocale.key: ?uiLocale?.name,
    });
  }

  @override
  Future<void> updateCardPreferences({
    required String uid,
    CardLanguageMode? cardLanguageMode,
    CardLanguage? primaryLanguage,
  }) {
    return _update(uid, <String, Object?>{
      UserField.cardLanguageMode.key: ?cardLanguageMode?.name,
      UserField.primaryLanguage.key: ?primaryLanguage?.name,
    });
  }

  Future<void> _update(String uid, Map<String, Object?> fields) {
    if (fields.isEmpty) {
      return Future<void>.value();
    }
    return _write(() => _doc(uid).update(fields));
  }

  Future<void> _write(Future<void> Function() write) async {
    try {
      await write();
    } on Object catch (error, stackTrace) {
      throw mapFirebaseError(error, stackTrace);
    }
  }
}
