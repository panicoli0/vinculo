import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Custom design tokens that Material 3 [ColorScheme] does not cover.
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  /// Creates the extension from explicit token values.
  const AppThemeExtension({
    required this.questionCardBackground,
    required this.questionCardForeground,
    required this.actionCardBackground,
    required this.actionCardForeground,
    required this.scenerySky,
    required this.sceneryMeadow,
    required this.sceneryFoliage,
    required this.sceneryBark,
    required this.sceneryBlossom,
  });

  /// Derives the tokens for [brightness]; question cards come from [baseScheme]
  /// and action cards from a second scheme seeded with [AppColors.actionSeed].
  factory AppThemeExtension.fromBrightness(
    Brightness brightness,
    ColorScheme baseScheme,
  ) {
    // Segundo esquema solo para las acciones: contraste AA garantizado por M3.
    final ColorScheme actionScheme = ColorScheme.fromSeed(
      seedColor: AppColors.actionSeed,
      brightness: brightness,
    );
    final bool isLight = switch (brightness) {
      Brightness.light => true,
      Brightness.dark => false,
    };
    return AppThemeExtension(
      questionCardBackground: baseScheme.primaryContainer,
      questionCardForeground: baseScheme.onPrimaryContainer,
      actionCardBackground: actionScheme.primaryContainer,
      actionCardForeground: actionScheme.onPrimaryContainer,
      scenerySky: isLight
          ? AppColors.scenerySkyLight
          : AppColors.scenerySkyDark,
      sceneryMeadow: isLight
          ? AppColors.sceneryMeadowLight
          : AppColors.sceneryMeadowDark,
      sceneryFoliage: isLight
          ? AppColors.sceneryFoliageLight
          : AppColors.sceneryFoliageDark,
      sceneryBark: isLight
          ? AppColors.sceneryBarkLight
          : AppColors.sceneryBarkDark,
      sceneryBlossom: isLight
          ? AppColors.sceneryBlossomLight
          : AppColors.sceneryBlossomDark,
    );
  }

  /// Background of question cards.
  final Color questionCardBackground;

  /// Text and icon color on question cards.
  final Color questionCardForeground;

  /// Background of action cards.
  final Color actionCardBackground;

  /// Text and icon color on action cards.
  final Color actionCardForeground;

  /// Decorative sky band behind the mascot. Never a text background.
  final Color scenerySky;

  /// Decorative garden ground and soft panels. Never a text background.
  final Color sceneryMeadow;

  /// Decorative leaves, sprouts and mascot body.
  final Color sceneryFoliage;

  /// Decorative tree trunk.
  final Color sceneryBark;

  /// Decorative flowers and accents.
  final Color sceneryBlossom;

  @override
  AppThemeExtension copyWith({
    Color? questionCardBackground,
    Color? questionCardForeground,
    Color? actionCardBackground,
    Color? actionCardForeground,
    Color? scenerySky,
    Color? sceneryMeadow,
    Color? sceneryFoliage,
    Color? sceneryBark,
    Color? sceneryBlossom,
  }) {
    return AppThemeExtension(
      questionCardBackground:
          questionCardBackground ?? this.questionCardBackground,
      questionCardForeground:
          questionCardForeground ?? this.questionCardForeground,
      actionCardBackground: actionCardBackground ?? this.actionCardBackground,
      actionCardForeground: actionCardForeground ?? this.actionCardForeground,
      scenerySky: scenerySky ?? this.scenerySky,
      sceneryMeadow: sceneryMeadow ?? this.sceneryMeadow,
      sceneryFoliage: sceneryFoliage ?? this.sceneryFoliage,
      sceneryBark: sceneryBark ?? this.sceneryBark,
      sceneryBlossom: sceneryBlossom ?? this.sceneryBlossom,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      questionCardBackground: Color.lerp(
        questionCardBackground,
        other.questionCardBackground,
        t,
      )!,
      questionCardForeground: Color.lerp(
        questionCardForeground,
        other.questionCardForeground,
        t,
      )!,
      actionCardBackground: Color.lerp(
        actionCardBackground,
        other.actionCardBackground,
        t,
      )!,
      actionCardForeground: Color.lerp(
        actionCardForeground,
        other.actionCardForeground,
        t,
      )!,
      scenerySky: Color.lerp(scenerySky, other.scenerySky, t)!,
      sceneryMeadow: Color.lerp(sceneryMeadow, other.sceneryMeadow, t)!,
      sceneryFoliage: Color.lerp(sceneryFoliage, other.sceneryFoliage, t)!,
      sceneryBark: Color.lerp(sceneryBark, other.sceneryBark, t)!,
      sceneryBlossom: Color.lerp(sceneryBlossom, other.sceneryBlossom, t)!,
    );
  }

  // Sin igualdad por valor, dos ThemeData con el mismo seed nunca son iguales
  // y AnimatedTheme dispara una animación en cada rebuild.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeExtension &&
          other.questionCardBackground == questionCardBackground &&
          other.questionCardForeground == questionCardForeground &&
          other.actionCardBackground == actionCardBackground &&
          other.actionCardForeground == actionCardForeground &&
          other.scenerySky == scenerySky &&
          other.sceneryMeadow == sceneryMeadow &&
          other.sceneryFoliage == sceneryFoliage &&
          other.sceneryBark == sceneryBark &&
          other.sceneryBlossom == sceneryBlossom;

  @override
  int get hashCode => Object.hash(
    questionCardBackground,
    questionCardForeground,
    actionCardBackground,
    actionCardForeground,
    scenerySky,
    sceneryMeadow,
    sceneryFoliage,
    sceneryBark,
    sceneryBlossom,
  );
}
