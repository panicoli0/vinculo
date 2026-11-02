import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_theme_extension.dart';
import 'app_typography.dart';

/// Factories for the light and dark Material 3 themes.
abstract final class AppTheme {
  // Se derivan una sola vez: cada _build corre ColorScheme.fromSeed dos veces.
  /// Light theme derived from [AppColors.seed].
  static final ThemeData light = _build(Brightness.light);

  /// Dark theme derived from [AppColors.seed].
  static final ThemeData dark = _build(Brightness.dark);

  /// Minimum height of buttons, so the main action is a comfortable target.
  static const double _buttonHeight = 56;

  /// Minimum size of a tap target (WCAG / Material guideline).
  static const double _minTarget = 48;

  static ThemeData _build(Brightness brightness) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: brightness,
    );
    // El tema base resuelve los colores del texto; la escala se aplica encima.
    final TextTheme textTheme = AppTypography.textTheme(
      ThemeData(useMaterial3: true, colorScheme: scheme).textTheme,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: AppRadius.pill,
          minimumSize: const Size(64, _buttonHeight),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: AppRadius.pill,
          minimumSize: const Size(64, _buttonHeight),
          textStyle: textTheme.labelLarge,
        ),
      ),
      // 48 y no 56: estos botones van en la barra superior y en diálogos.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: AppRadius.pill,
          minimumSize: const Size(64, _minTarget),
          textStyle: textTheme.labelLarge,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          minimumSize: const Size(_minTarget, _minTarget),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: scheme.onSurface),
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppThemeExtension.fromBrightness(brightness, scheme),
      ],
    );
  }
}
