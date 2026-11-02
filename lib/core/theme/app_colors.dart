import 'package:flutter/painting.dart';

/// Seed colors for the app palettes plus the decorative scenery constants.
abstract final class AppColors {
  /// Primary seed (verde de la maqueta) used to derive the whole Material 3
  /// scheme.
  // Único punto de cambio para la paleta principal.
  static const Color seed = Color(0xFF5C9E55);

  /// Seed (durazno) used to derive the action-card palette.
  // Único punto de cambio para la paleta de las cartas de acción.
  static const Color actionSeed = Color(0xFFE2906B);

  // Escenografía: colores decorativos, nunca el par fondo/texto de un
  // contraste. El contraste AA lo garantizan los esquemas de fromSeed.

  /// Sky band behind the mascot, light theme.
  static const Color scenerySkyLight = Color(0xFFBFE5F7);

  /// Sky band behind the mascot, dark theme.
  static const Color scenerySkyDark = Color(0xFF16303D);

  /// Garden ground and soft panels, light theme.
  static const Color sceneryMeadowLight = Color(0xFFD9EDC4);

  /// Garden ground and soft panels, dark theme.
  static const Color sceneryMeadowDark = Color(0xFF27351F);

  /// Leaves, sprouts and mascot body, light theme.
  static const Color sceneryFoliageLight = Color(0xFF9ECF70);

  /// Leaves, sprouts and mascot body, dark theme.
  static const Color sceneryFoliageDark = Color(0xFF5E8A3E);

  /// Tree trunk, light theme.
  static const Color sceneryBarkLight = Color(0xFFB07A4F);

  /// Tree trunk, dark theme.
  static const Color sceneryBarkDark = Color(0xFF6E4A2E);

  /// Flowers and accents, light theme.
  static const Color sceneryBlossomLight = Color(0xFFF6AE8E);

  /// Flowers and accents, dark theme.
  static const Color sceneryBlossomDark = Color(0xFF7E4A36);
}
