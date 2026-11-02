import '../domain/device_preferences.dart';
import '../domain/preferences_repository.dart';

/// [PreferencesRepository] that keeps values in memory only.
final class InMemoryPreferencesRepository implements PreferencesRepository {
  /// Creates a repository seeded with [initial].
  InMemoryPreferencesRepository({
    DevicePreferences initial = const DevicePreferences(),
  }) : _preferences = initial;

  DevicePreferences _preferences;

  @override
  Future<DevicePreferences> load() async => _preferences;

  @override
  Future<void> save(DevicePreferences preferences) async {
    _preferences = preferences;
  }
}
