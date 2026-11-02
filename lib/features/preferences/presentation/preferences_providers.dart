import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/app_theme_mode.dart';
import '../domain/device_preferences.dart';
import '../domain/preferences_repository.dart';
import '../domain/ui_locale_option.dart';
import 'ui_locale_binding.dart';

part 'preferences_providers.g.dart';

/// The [PreferencesRepository]; must be overridden in bootstrap.
@Riverpod(keepAlive: true)
PreferencesRepository preferencesRepository(Ref ref) =>
    throw UnimplementedError(
      'preferencesRepositoryProvider must be overridden in bootstrap',
    );

/// Preferences loaded once at startup so the router can redirect synchronously.
/// Must be overridden in bootstrap.
@Riverpod(keepAlive: true)
DevicePreferences initialPreferences(Ref ref) => throw UnimplementedError(
  'initialPreferencesProvider must be overridden in bootstrap',
);

/// Current [DevicePreferences], persisted through the [PreferencesRepository].
@Riverpod(keepAlive: true)
class PreferencesController extends _$PreferencesController {
  @override
  DevicePreferences build() => ref.read(initialPreferencesProvider);

  /// Persists and publishes the interface language, then applies it live.
  Future<void> setUiLocale(UiLocaleOption value) async {
    await _update(state.copyWith(uiLocale: value));
    applyUiLocale(value);
  }

  /// Persists and publishes the theme brightness.
  Future<void> setThemeMode(AppThemeMode value) =>
      _update(state.copyWith(themeMode: value));

  /// Persists and publishes the answer to the analytics consent question.
  Future<void> setAnalyticsConsent({required bool value}) =>
      _update(state.copyWith(analyticsConsent: value));

  /// Persists and publishes the instant until which the age gate locks the
  /// device.
  Future<void> lockAgeGateUntil(DateTime value) =>
      _update(state.copyWith(ageGateLockedUntil: value));

  /// Persists and publishes an invite code captured before sign-in.
  Future<void> setPendingInviteCode(String value) =>
      _update(state.copyWith(pendingInviteCode: value));

  /// Removes the stored invite code once it has been used or discarded.
  Future<void> clearPendingInviteCode() =>
      _update(state.copyWith(pendingInviteCode: null));

  /// Removes the age gate lock.
  Future<void> clearAgeGateLock() =>
      _update(state.copyWith(ageGateLockedUntil: null));

  // Guarda primero y publica después: si el guardado falla, el estado no cambia.
  Future<void> _update(DevicePreferences updated) async {
    await ref.read(preferencesRepositoryProvider).save(updated);
    if (!ref.mounted) {
      return;
    }
    state = updated;
  }
}
