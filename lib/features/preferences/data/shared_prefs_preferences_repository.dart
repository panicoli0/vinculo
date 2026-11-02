import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/app_failure.dart';
import '../domain/app_theme_mode.dart';
import '../domain/device_preferences.dart';
import '../domain/preferences_repository.dart';
import '../domain/ui_locale_option.dart';
import 'preference_key.dart';

/// [PreferencesRepository] persisting to `shared_preferences`.
final class SharedPrefsPreferencesRepository implements PreferencesRepository {
  /// Creates a repository over [_preferences].
  const SharedPrefsPreferencesRepository(this._preferences);

  final SharedPreferences _preferences;

  /// Los defaults viven solo en [DevicePreferences].
  static const DevicePreferences _defaults = DevicePreferences();

  @override
  Future<DevicePreferences> load() async {
    try {
      final int? lockedUntilMillis = _preferences.getInt(
        PreferenceKey.ageGateLockedUntil.storageKey,
      );
      return DevicePreferences(
        uiLocale: _enumByName(
          UiLocaleOption.values,
          _preferences.getString(PreferenceKey.uiLocale.storageKey),
          _defaults.uiLocale,
        ),
        themeMode: _enumByName(
          AppThemeMode.values,
          _preferences.getString(PreferenceKey.themeMode.storageKey),
          _defaults.themeMode,
        ),
        // Sin `??`: null significa "nunca se preguntó", distinto de false.
        analyticsConsent: _preferences.getBool(
          PreferenceKey.analyticsConsent.storageKey,
        ),
        ageGateLockedUntil: lockedUntilMillis == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(lockedUntilMillis),
        pendingInviteCode: _preferences.getString(
          PreferenceKey.pendingInviteCode.storageKey,
        ),
      );
    } on Object catch (error, stackTrace) {
      throw AppFailure.storage(
        message: 'Could not read preferences',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> save(DevicePreferences preferences) async {
    final bool? consent = preferences.analyticsConsent;
    final DateTime? lockedUntil = preferences.ageGateLockedUntil;
    final String? inviteCode = preferences.pendingInviteCode;
    try {
      // Un campo opcional en null se borra: no se escribe un valor ficticio.
      await Future.wait<bool>(<Future<bool>>[
        _preferences.setString(
          PreferenceKey.uiLocale.storageKey,
          preferences.uiLocale.name,
        ),
        _preferences.setString(
          PreferenceKey.themeMode.storageKey,
          preferences.themeMode.name,
        ),
        consent == null
            ? _preferences.remove(PreferenceKey.analyticsConsent.storageKey)
            : _preferences.setBool(
                PreferenceKey.analyticsConsent.storageKey,
                consent,
              ),
        lockedUntil == null
            ? _preferences.remove(PreferenceKey.ageGateLockedUntil.storageKey)
            : _preferences.setInt(
                PreferenceKey.ageGateLockedUntil.storageKey,
                lockedUntil.millisecondsSinceEpoch,
              ),
        inviteCode == null
            ? _preferences.remove(PreferenceKey.pendingInviteCode.storageKey)
            : _preferences.setString(
                PreferenceKey.pendingInviteCode.storageKey,
                inviteCode,
              ),
      ]);
    } on Object catch (error, stackTrace) {
      throw AppFailure.storage(
        message: 'Could not save preferences',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}

/// Parses [raw] as the name of a value of [values]; [fallback] when it is
/// missing or unknown, so a renamed value degrades instead of crashing.
T _enumByName<T extends Enum>(List<T> values, String? raw, T fallback) {
  for (final T value in values) {
    if (value.name == raw) {
      return value;
    }
  }
  return fallback;
}
