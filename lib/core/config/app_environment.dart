/// Which Firebase project and flavor the build targets.
enum AppEnvironment {
  /// Development flavor, backed by the `vinculo-dev-ics` Firebase project.
  dev('dev'),

  /// Production flavor, backed by the `vinculo-prod-ics` Firebase project.
  prod('prod');

  const AppEnvironment(this.wireName);

  /// Value of the `ENVIRONMENT` dart-define.
  final String wireName;

  /// Returns the environment whose [wireName] equals [raw]; [dev] when unknown,
  /// so a typo in an env file degrades to the safe target instead of crashing.
  static AppEnvironment fromWireName(String raw) {
    for (final AppEnvironment environment in values) {
      if (environment.wireName == raw) {
        return environment;
      }
    }
    return dev;
  }
}
