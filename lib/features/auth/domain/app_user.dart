import 'package:freezed_annotation/freezed_annotation.dart';

import '../../content/domain/card_language.dart';
import '../../content/domain/card_language_mode.dart';
import '../../preferences/domain/ui_locale_option.dart';
import 'account_type.dart';
import 'joined_via_info.dart';
import 'minor_consent.dart';

part 'app_user.freezed.dart';

/// The private `users/{uid}` document of the signed-in person (data_model §2).
///
/// Solo lo lee su dueño: lo que ve el resto de la familia vive en
/// `families/{id}/members/{uid}`. El año de nacimiento nunca va a analytics.
@freezed
abstract class AppUser with _$AppUser {
  /// Creates a user.
  const factory AppUser({
    /// Auth uid; it is the document id, not a stored field.
    required String uid,

    /// Adult, or minor created by a guardian.
    required AccountType accountType,

    /// Name shown to the family, 1 to 40 characters.
    required String displayName,

    /// Year of birth; immutable from the client.
    required int birthYear,

    /// Interface language choice, mirrored from the device preference.
    required UiLocaleOption uiLocale,

    /// How card text is shown.
    required CardLanguageMode cardLanguageMode,

    /// Language shown large in bilingual mode.
    required CardLanguage primaryLanguage,

    /// Creation instant; null while the server timestamp of a local write is
    /// still pending.
    DateTime? createdAt,

    /// Parental consent; only minors have one.
    MinorConsent? consent,

    /// How the person joined the family; null for whoever created it.
    JoinedViaInfo? joinedVia,

    /// When the person first answered a question.
    DateTime? firstAnsweredAt,

    /// When the subscription fake door was first shown.
    DateTime? fakeDoorSeenAt,
  }) = _AppUser;

  const AppUser._();

  /// Whether this is a minor profile.
  bool get isMinor => accountType == AccountType.minor;
}
