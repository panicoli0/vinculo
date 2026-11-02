import 'package:flutter/material.dart';

import '../core/config/app_identity.dart';
import '../core/theme/app_theme.dart';

/// Minimal app shown while Auth and the user document have not answered yet.
///
/// Evita rebotar a `/welcome` y volver al arrancar con una sesión guardada, lo
/// que se vería como un parpadeo.
final class SessionLoadingApp extends StatelessWidget {
  /// Creates the loading app with the same [themeMode] the real one will use,
  /// so the background does not flash.
  const SessionLoadingApp({required this.themeMode, super.key});

  /// Brightness the user chose.
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppIdentity.name,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
