import 'package:flutter/material.dart';

import '../i18n/translations.g.dart';
import '../theme/app_spacing.dart';

/// Stand-in screen used by every route until its real screen lands.
///
/// Una sola pantalla para todas las rutas hasta que lleguen las reales.
final class PlaceholderScreen extends StatelessWidget {
  /// Creates a placeholder titled [title].
  const PlaceholderScreen({required this.title, super.key});

  /// Localized screen title shown in the app bar.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            context.t.placeholder.body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
