import 'device_preferences.dart';

/// Persistence of [DevicePreferences].
abstract interface class PreferencesRepository {
  /// Loads the stored preferences, or defaults when nothing is stored.
  Future<DevicePreferences> load();

  /// Stores [preferences]; a null optional field removes its stored value.
  Future<void> save(DevicePreferences preferences);
}
