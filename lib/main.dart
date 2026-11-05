import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/bootstrap_failure_app.dart';
import 'core/analytics/analytics_providers.dart';
import 'core/config/app_config.dart';
import 'core/errors/console_error_reporter.dart';
import 'core/errors/error_reporter.dart';
import 'core/firebase/firebase_bootstrap.dart';
import 'core/i18n/translations.g.dart';
import 'features/auth/data/callable_account_deletion_repository.dart';
import 'features/auth/data/firebase_auth_repository.dart';
import 'features/auth/data/firestore_user_repository.dart';
import 'features/auth/data/in_memory_account_deletion_repository.dart';
import 'features/auth/data/in_memory_auth_repository.dart';
import 'features/auth/data/in_memory_user_repository.dart';
import 'features/auth/domain/account_deletion_repository.dart';
import 'features/auth/domain/auth_repository.dart';
import 'features/auth/domain/user_repository.dart';
import 'features/auth/presentation/auth_providers.dart';
import 'features/family/data/firestore_family_repository.dart';
import 'features/family/data/in_memory_family_repository.dart';
import 'features/family/domain/family_repository.dart';
import 'features/family/presentation/family_providers.dart';
import 'features/preferences/data/shared_prefs_preferences_repository.dart';
import 'features/preferences/domain/device_preferences.dart';
import 'features/preferences/domain/preferences_repository.dart';
import 'features/preferences/presentation/preferences_providers.dart';
import 'features/preferences/presentation/ui_locale_binding.dart';

/// Boots the app.
///
/// Cualquier fallo del arranque se reporta y termina igual en un `runApp`:
/// una excepción antes de `runApp` dejaría la pantalla en negro para siempre,
/// porque el error screen de Flutter solo cubre errores de build.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Respaldo: si cargar las preferencias es lo que falla, el `runApp` del
  // catch igual sale localizado con el idioma del dispositivo.
  LocaleSettings.useDeviceLocaleSync();

  try {
    await _boot();
  } on Object catch (error, stackTrace) {
    const ErrorReporter errorReporter = ConsoleErrorReporter();
    errorReporter.reportNonFatal(
      'bootstrap_failed',
      cause: error,
      stackTrace: stackTrace,
    );
    runApp(TranslationProvider(child: const BootstrapFailureApp()));
  }
}

/// Initializes Firebase (when enabled), loads the device preferences and
/// starts the app.
///
/// Las preferencias se cargan una sola vez antes de `runApp` para que el
/// router pueda leerlas de forma síncrona. Con `USE_FIREBASE=false` no se toca
/// Firebase para nada.
Future<void> _boot() async {
  const AppConfig config = AppConfig.fromEnvironment;
  if (config.useFirebase) {
    await initializeFirebase(
      config.environment,
      useEmulators: config.useEmulators,
    );
  }
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final PreferencesRepository preferencesRepository =
      SharedPrefsPreferencesRepository(sharedPreferences);
  final DevicePreferences preferences = await preferencesRepository.load();
  applyUiLocale(preferences.uiLocale);

  // Con Firebase apagado se usan los dobles en memoria; los de Firebase se
  // crean recién acá, después de `initializeFirebase`.
  final AuthRepository authRepository = config.useFirebase
      ? FirebaseAuthRepository(
          googleServerClientId: config.googleServerClientId,
          appleServiceId: config.appleServiceId,
          appleRedirectUri: config.appleRedirectUri,
        )
      : InMemoryAuthRepository();
  final UserRepository userRepository = config.useFirebase
      ? FirestoreUserRepository()
      : InMemoryUserRepository();
  final AccountDeletionRepository accountDeletionRepository = config.useFirebase
      ? const CallableAccountDeletionRepository()
      : const InMemoryAccountDeletionRepository();
  final FamilyRepository familyRepository = config.useFirebase
      ? FirestoreFamilyRepository()
      : InMemoryFamilyRepository();

  runApp(
    ProviderScope(
      overrides: <Override>[
        preferencesRepositoryProvider.overrideWith(
          (Ref ref) => preferencesRepository,
        ),
        initialPreferencesProvider.overrideWith((Ref ref) => preferences),
        authRepositoryProvider.overrideWith((Ref ref) => authRepository),
        userRepositoryProvider.overrideWith((Ref ref) => userRepository),
        accountDeletionRepositoryProvider.overrideWith(
          (Ref ref) => accountDeletionRepository,
        ),
        familyRepositoryProvider.overrideWith((Ref ref) => familyRepository),
        // El gate de analytics.md §1 vive en core/, pero el consentimiento es
        // de una feature: el bootstrap, que conoce ambos lados, resuelve la
        // dependencia. Sin respuesta (null) la analítica queda APAGADA.
        // TODO(fase-6-analitica-adulta): hoy el gate solo mira el consentimiento;
        // falta sumar la condición de cuenta adulta (analytics.md §1: siempre
        // apagada para menores). Las cuentas de menores llegan en la Fase 2, así
        // que NO se puede cablear FirebaseAnalyticsService (ni Crashlytics, #14)
        // antes de resolver `consentimiento && cuenta adulta`: en cuanto el
        // delegate deje de ser ConsoleAnalytics, un menor que acepte el
        // consentimiento enviaría eventos fuera del teléfono.
        analyticsEnabledProvider.overrideWith(
          (Ref ref) => ref.watch(
            preferencesControllerProvider.select(
              (DevicePreferences p) => p.analyticsConsent ?? false,
            ),
          ),
        ),
      ],
      child: TranslationProvider(child: const VinculoApp()),
    ),
  );
}
