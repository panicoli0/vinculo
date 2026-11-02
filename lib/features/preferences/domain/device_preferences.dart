import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_theme_mode.dart';
import 'ui_locale_option.dart';

part 'device_preferences.freezed.dart';

/// Settings persisted on this device only.
///
/// Firestore es la fuente de verdad del usuario; acá solo vive lo que es del
/// teléfono o lo que hace falta antes de que haya sesión.
@freezed
abstract class DevicePreferences with _$DevicePreferences {
  /// Creates preferences; defaults match a fresh install.
  const factory DevicePreferences({
    /// Interface language choice.
    @Default(UiLocaleOption.system) UiLocaleOption uiLocale,

    /// Light, dark or system theme.
    @Default(AppThemeMode.system) AppThemeMode themeMode,

    /// Analytics consent; null means the question was never asked.
    bool? analyticsConsent,

    /// Instant until which the age gate keeps this device locked out.
    DateTime? ageGateLockedUntil,

    /// Invite code captured from a deep link before sign-in.
    String? pendingInviteCode,
  }) = _DevicePreferences;
}
