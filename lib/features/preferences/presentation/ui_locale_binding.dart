import '../../../core/i18n/translations.g.dart';
import '../domain/ui_locale_option.dart';

/// Applies [option] to slang so the whole app relocalizes immediately.
///
/// Debe llamarse fuera de la fase de build (bootstrap o un setter), porque
/// notifica a TranslationProvider, que es ancestro de la app.
void applyUiLocale(UiLocaleOption option) {
  switch (option) {
    case UiLocaleOption.system:
      LocaleSettings.useDeviceLocaleSync();
    case UiLocaleOption.es:
      LocaleSettings.setLocaleSync(AppLocale.es);
    case UiLocaleOption.en:
      LocaleSettings.setLocaleSync(AppLocale.en);
  }
}
