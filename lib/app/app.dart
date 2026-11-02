import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/app_identity.dart';
import '../core/i18n/translations.g.dart';
import '../core/theme/app_theme.dart';
import '../features/preferences/domain/app_theme_mode.dart';
import '../features/preferences/domain/device_preferences.dart';
import '../features/preferences/presentation/preferences_providers.dart';
import 'router/app_router.dart';
import 'router/router_gate.dart';
import 'session_loading_app.dart';

/// Root widget: wires the router, the themes and the locale.
///
/// Mientras la sesión no responde por primera vez muestra [SessionLoadingApp]
/// y recién entonces monta `MaterialApp.router`. Es una excepción consciente a
/// "evitar reescribir el árbol con if/else": son dos `MaterialApp` distintos,
/// ocurre una sola vez por arranque y la alternativa (montar el router y
/// rebotar a `/welcome` y volver) produce un parpadeo visible. Una vez
/// resuelta, la sesión nunca vuelve a desmontar el router: un `loading`
/// posterior (p. ej. justo después de iniciar sesión) lo absorbe el `redirect`.
final class VinculoApp extends ConsumerStatefulWidget {
  /// Creates the root widget.
  const VinculoApp({super.key});

  @override
  ConsumerState<VinculoApp> createState() => _VinculoAppState();
}

class _VinculoAppState extends ConsumerState<VinculoApp> {
  /// Whether the session answered at least once since the app started.
  bool _sessionResolved = false;

  @override
  Widget build(BuildContext context) {
    final bool isLoading = ref.watch(
      routerGateProvider.select(
        (RouterGate gate) => gate == RouterGate.loading,
      ),
    );
    // Pestillo monótono deliberado: una vez resuelta, la sesión no vuelve a
    // desmontar el router. Mutar acá es idempotente y lo dispara el valor
    // observado.
    _sessionResolved = _sessionResolved || !isLoading;
    final ThemeMode themeMode = _flutterThemeMode(
      ref.watch(
        preferencesControllerProvider.select(
          (DevicePreferences preferences) => preferences.themeMode,
        ),
      ),
    );
    if (!_sessionResolved) {
      return SessionLoadingApp(themeMode: themeMode);
    }
    return MaterialApp.router(
      title: AppIdentity.name,
      routerConfig: ref.watch(appRouterProvider),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}

/// Maps the domain [AppThemeMode] onto Flutter's [ThemeMode].
ThemeMode _flutterThemeMode(AppThemeMode mode) => switch (mode) {
  AppThemeMode.system => ThemeMode.system,
  AppThemeMode.light => ThemeMode.light,
  AppThemeMode.dark => ThemeMode.dark,
};
