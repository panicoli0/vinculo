import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../preferences/domain/ui_locale_option.dart';
import 'app_user.dart';
import 'display_name_policy.dart';

/// Access to the private `users/{uid}` document.
abstract interface class UserRepository {
  /// Emits the user of [uid], or null while the document does not exist.
  Stream<AppUser?> watchUser(String uid);

  /// Creates the document of an adult who passed the age gate.
  ///
  /// Escribe solo el mapa cerrado que acepta la regla; nunca `consent`,
  /// `joinedVia` ni `firstAnsweredAt`.
  ///
  /// The `displayName` is stored verbatim: it must be the value to store,
  /// already trimmed, satisfying [isValidDisplayName] and at most
  /// [kDisplayNameMaxUtf16Units] UTF-16 units **as passed**. La regla acota el
  /// valor crudo, no el trimeado: `isValidDisplayName` sola no alcanza.
  Future<void> createAdult({
    required String uid,
    required String displayName,
    required int birthYear,
    required UiLocaleOption uiLocale,
    required CardLanguageMode cardLanguageMode,
    required CardLanguage primaryLanguage,
  });

  /// Updates the given profile fields; a null argument is left untouched.
  ///
  /// A non-null `displayName` is stored verbatim: it must be the value to
  /// store, already trimmed, satisfying [isValidDisplayName] and at most
  /// [kDisplayNameMaxUtf16Units] UTF-16 units **as passed**. La regla acota el
  /// valor crudo, no el trimeado: `isValidDisplayName` sola no alcanza.
  ///
  /// La cota es parte del contrato porque la regla de Firestore rechaza el
  /// write si no se cumple, y mandar un write que las reglas rechazan es
  /// exactamente lo que prohíbe la regla 3 de `AGENTS.md`. Las
  /// implementaciones lo verifican con un `assert`, que no corre en release.
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
