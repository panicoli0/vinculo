import 'package:flutter/painting.dart';

/// Corner radius scale shared across the UI, in logical pixels.
///
/// Constantes simples y no una ThemeExtension: no cambian con el brillo.
abstract final class AppRadius {
  /// Small radius: chips, inputs.
  static const double sm = 12;

  /// Medium radius: inner panels.
  static const double md = 20;

  /// Large radius: cards.
  static const double lg = 28;

  /// Fully rounded ends: pill buttons.
  static const StadiumBorder pill = StadiumBorder();
}
