import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../preferences/domain/ui_locale_option.dart';
import 'app_user.dart';

/// Access to the private `users/{uid}` document.
abstract interface class UserRepository {
  /// Emits the user of [uid], or null while the document does not exist.
  Stream<AppUser?> watchUser(String uid);

  /// Creates the document of an adult who passed the age gate.
  ///
  /// Escribe solo el mapa cerrado que acepta la regla; nunca `consent`,
  /// `joinedVia` ni `firstAnsweredAt`.
  Future<void> createAdult({
    required String uid,
    required String displayName,
    required int birthYear,
    required UiLocaleOption uiLocale,
    required CardLanguageMode cardLanguageMode,
    required CardLanguage primaryLanguage,
  });

  /// Updates the given profile fields; a null argument is left untouched.
  Future<void> updateProfile({
    required String uid,
    String? displayName,
    UiLocaleOption? uiLocale,
  });

  /// Updates the given card preferences; a null argument is left untouched.
  Future<void> updateCardPreferences({
    required String uid,
    CardLanguageMode? cardLanguageMode,
    CardLanguage? primaryLanguage,
  });
}
