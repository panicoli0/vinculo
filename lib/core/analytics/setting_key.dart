/// Settings whose change is reported as `setting_changed` (analytics.md §2).
enum SettingKey {
  /// How card text is shown (english / spanish / bilingual).
  cardLanguageMode('card_language_mode'),

  /// Language shown large in bilingual mode.
  primaryLanguage('primary_language'),

  /// Interface language.
  uiLocale('ui_locale'),

  /// Theme brightness.
  themeMode('theme_mode'),

  /// Anonymous usage data consent.
  analyticsEnabled('analytics_enabled');

  const SettingKey(this.wireName);

  /// Snake-case name sent as the `key` parameter.
  final String wireName;
}
