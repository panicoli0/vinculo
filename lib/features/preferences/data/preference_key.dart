/// Storage keys of the persisted device preferences.
///
/// Los nombres son un contrato de almacenamiento: un error de tipeo hace que
/// se pierdan en silencio los ajustes de los usuarios.
enum PreferenceKey {
  /// Interface language choice.
  uiLocale('prefs.uiLocale'),

  /// Light, dark or system theme.
  themeMode('prefs.themeMode'),

  /// Whether analytics events may be sent; absent until the user answers.
  analyticsConsent('prefs.analyticsConsent'),

  /// Epoch milliseconds until which the age gate locks the device.
  ageGateLockedUntil('prefs.ageGateLockedUntil'),

  /// Invite code captured from a deep link before sign-in.
  pendingInviteCode('prefs.pendingInviteCode');

  const PreferenceKey(this.storageKey);

  /// Key under which the value is stored.
  final String storageKey;
}
