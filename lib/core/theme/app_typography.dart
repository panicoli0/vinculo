import 'package:flutter/material.dart';

/// Type scale of the app, set in the bundled Nunito variable font.
///
/// Nunito[wght].ttf es una fuente variable: con solo `fontWeight` Flutter
/// sintetiza la negrita y se ve mal. Todos los estilos pasan por [_style], que
/// fija el peso y el eje `wght` con el mismo valor, para que ningún sitio de
/// uso tenga que pensarlo.
abstract final class AppTypography {
  /// Family name declared in `pubspec.yaml`.
  static const String family = 'Nunito';

  /// Primary text of a card in single-language mode (readable at arm's
  /// length). Colorless: the caller supplies the card foreground.
  static final TextStyle cardPrimarySingle = _style(32, FontWeight.w700);

  /// Primary text of a card in bilingual mode. Colorless.
  static final TextStyle cardPrimaryBilingual = _style(24, FontWeight.w700);

  /// Secondary text of a card in bilingual mode; the caller dims it.
  static final TextStyle cardSecondary = _style(20, FontWeight.w400);

  /// Applies the app type scale on top of [base].
  ///
  /// Roles not in the scale keep Material's size and weight but still get the
  /// family and the matching `wght` variation.
  static TextTheme textTheme(TextTheme base) {
    final TextTheme scaled = base
        .apply(fontFamily: family)
        .copyWith(
          headlineLarge: base.headlineLarge?.merge(_style(32, FontWeight.w700)),
          headlineMedium: base.headlineMedium?.merge(
            _style(28, FontWeight.w700),
          ),
          headlineSmall: base.headlineSmall?.merge(_style(24, FontWeight.w600)),
          titleLarge: base.titleLarge?.merge(_style(22, FontWeight.w600)),
          titleMedium: base.titleMedium?.merge(_style(18, FontWeight.w600)),
          // 18 y no los 16 de M3: se diseña para el jugador mayor.
          bodyLarge: base.bodyLarge?.merge(_style(18, FontWeight.w400)),
          bodyMedium: base.bodyMedium?.merge(_style(16, FontWeight.w400)),
          labelLarge: base.labelLarge?.merge(_style(18, FontWeight.w600)),
        );
    return TextTheme(
      displayLarge: _synced(scaled.displayLarge),
      displayMedium: _synced(scaled.displayMedium),
      displaySmall: _synced(scaled.displaySmall),
      headlineLarge: _synced(scaled.headlineLarge),
      headlineMedium: _synced(scaled.headlineMedium),
      headlineSmall: _synced(scaled.headlineSmall),
      titleLarge: _synced(scaled.titleLarge),
      titleMedium: _synced(scaled.titleMedium),
      titleSmall: _synced(scaled.titleSmall),
      bodyLarge: _synced(scaled.bodyLarge),
      bodyMedium: _synced(scaled.bodyMedium),
      bodySmall: _synced(scaled.bodySmall),
      labelLarge: _synced(scaled.labelLarge),
      labelMedium: _synced(scaled.labelMedium),
      labelSmall: _synced(scaled.labelSmall),
    );
  }

  static TextStyle _style(double size, FontWeight weight) => TextStyle(
    fontFamily: family,
    fontSize: size,
    fontWeight: weight,
    fontVariations: _variationsFor(weight),
  );

  /// Copy of [style] whose `wght` axis matches its own `fontWeight`.
  static TextStyle? _synced(TextStyle? style) => style?.copyWith(
    fontVariations: _variationsFor(style.fontWeight ?? FontWeight.w400),
  );

  static List<FontVariation> _variationsFor(FontWeight weight) =>
      <FontVariation>[FontVariation('wght', weight.value.toDouble())];
}
