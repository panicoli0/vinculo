import 'dart:async';

import '../../../core/errors/app_failure.dart';
import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../preferences/domain/ui_locale_option.dart';
import '../domain/account_type.dart';
import '../domain/app_user.dart';
import '../domain/display_name_policy.dart';
import '../domain/user_repository.dart';

/// [UserRepository] that keeps the users in memory, for `USE_FIREBASE=false`.
final class InMemoryUserRepository implements UserRepository {
  /// Creates an empty repository.
  InMemoryUserRepository();

  final Map<String, AppUser> _users = <String, AppUser>{};
  final Map<String, Set<StreamController<AppUser?>>> _watchers =
      <String, Set<StreamController<AppUser?>>>{};

  @override
  Stream<AppUser?> watchUser(String uid) {
    late final StreamController<AppUser?> controller;
    controller = StreamController<AppUser?>(
      onListen: () {
        controller.add(_users[uid]);
        _watchers
            .putIfAbsent(uid, () => <StreamController<AppUser?>>{})
            .add(controller);
      },
      onCancel: () {
        _watchers[uid]?.remove(controller);
      },
    );
    return controller.stream;
  }

  @override
  Future<void> createAdult({
    required String uid,
    required String displayName,
    required int birthYear,
    required UiLocaleOption uiLocale,
    required CardLanguageMode cardLanguageMode,
    required CardLanguage primaryLanguage,
  }) async {
    // Mismo contrato que `updateProfile`: el nombre se guarda tal cual, y la
    // regla acota el valor crudo. Hoy el llamador ya pasa `.trim()`, pero el
    // assert lo documenta y lo atrapa.
    assert(
      isValidDisplayName(displayName) &&
          displayName.length <= kDisplayNameMaxUtf16Units,
      'displayName must be the stored value: valid and at most '
      '$kDisplayNameMaxUtf16Units UTF-16 units raw',
    );
    _put(
      AppUser(
        uid: uid,
        accountType: AccountType.adult,
        displayName: displayName,
        birthYear: birthYear,
        uiLocale: uiLocale,
        cardLanguageMode: cardLanguageMode,
        primaryLanguage: primaryLanguage,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> updateProfile({
    required String uid,
    String? displayName,
    UiLocaleOption? uiLocale,
  }) async {
    // El contrato de `UserRepository.updateProfile` exige el valor a guardar;
    // se verifica también acá para que `USE_FIREBASE=false` no sea el camino
    // donde el defecto pasa inadvertido hasta llegar a Firestore.
    assert(
      displayName == null ||
          (isValidDisplayName(displayName) &&
              displayName.length <= kDisplayNameMaxUtf16Units),
      'displayName must be the stored value: valid and at most '
      '$kDisplayNameMaxUtf16Units UTF-16 units raw',
    );
    final AppUser current = _current(uid);
    _put(
      current.copyWith(
        displayName: displayName ?? current.displayName,
        uiLocale: uiLocale ?? current.uiLocale,
      ),
    );
  }

  @override
  Future<void> updateCardPreferences({
    required String uid,
    CardLanguageMode? cardLanguageMode,
    CardLanguage? primaryLanguage,
  }) async {
    final AppUser current = _current(uid);
    _put(
      current.copyWith(
        cardLanguageMode: cardLanguageMode ?? current.cardLanguageMode,
        primaryLanguage: primaryLanguage ?? current.primaryLanguage,
      ),
    );
  }

  /// The stored user, or [AppFailure.notFound] like Firestore's `update`.
  AppUser _current(String uid) {
    final AppUser? user = _users[uid];
    if (user == null) {
      throw const AppFailure.notFound(message: 'users document does not exist');
    }
    return user;
  }

  void _put(AppUser user) {
    _users[user.uid] = user;
    for (final StreamController<AppUser?> watcher
        in _watchers[user.uid] ?? const <StreamController<AppUser?>>{}) {
      watcher.add(user);
    }
  }
}
