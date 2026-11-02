import 'package:flutter/material.dart';

import '../../features/content/domain/card_language.dart';
import '../../features/content/domain/card_language_mode.dart';
import '../../features/content/domain/card_text.dart';
import '../../features/content/domain/formality.dart';
import '../theme/app_spacing.dart';

/// Renders a [CardText] according to the card language [mode].
///
/// In bilingual mode the [primaryLanguage] text is shown large on top and the
/// other language smaller and dimmed below a divider. Has no flip or gestures
/// and does not scroll: the host supplies the scroll view.
final class CardTextView extends StatelessWidget {
  /// Creates a view of [text].
  const CardTextView({
    required this.text,
    required this.mode,
    required this.primaryLanguage,
    required this.formality,
    this.primaryStyle,
    this.secondaryStyle,
    super.key,
  });

  /// Text to render.
  final CardText text;

  /// Which language or languages are shown.
  final CardLanguageMode mode;

  /// Language shown large in bilingual mode.
  final CardLanguage primaryLanguage;

  /// Spanish form of address used to resolve [text].
  final Formality formality;

  /// Style of the main text; defaults to the theme's headline small.
  final TextStyle? primaryStyle;

  /// Style of the secondary text in bilingual mode; defaults to the theme's
  /// title medium, dimmed.
  final TextStyle? secondaryStyle;

  /// Opacity applied to the primary color to dim the secondary text.
  static const double secondaryOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? primary = primaryStyle ?? textTheme.headlineSmall;
    // `copyWith(color: null)` conserva el color, no lo borra: se resuelve un
    // color base concreto antes de atenuarlo. El tema M3 no define color en
    // headlineSmall, así que sin esto el texto secundario nunca se atenuaría.
    final Color baseColor =
        primary?.color ??
        DefaultTextStyle.of(context).style.color ??
        Theme.of(context).colorScheme.onSurface;
    final TextStyle? secondary =
        secondaryStyle ??
        textTheme.titleMedium?.copyWith(
          color: baseColor.withValues(alpha: secondaryOpacity),
        );

    // En los modos monolingües el idioma está fijado; en bilingüe manda el principal.
    final CardLanguage mainLanguage = switch (mode) {
      CardLanguageMode.english => CardLanguage.en,
      CardLanguageMode.spanish => CardLanguage.es,
      CardLanguageMode.bilingual => primaryLanguage,
    };
    final String mainText = text.resolve(mainLanguage, formality);
    final String? otherText = switch (mode) {
      CardLanguageMode.english || CardLanguageMode.spanish => null,
      CardLanguageMode.bilingual => text.resolve(
        _other(mainLanguage),
        formality,
      ),
    };

    // Un solo nodo semántico: el lector de pantalla lee principal y luego
    // secundario, sin anunciar el divisor.
    return Semantics(
      container: true,
      label: otherText == null ? mainText : '$mainText\n$otherText',
      child: ExcludeSemantics(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(mainText, style: primary, textAlign: TextAlign.center),
            if (otherText != null) ...<Widget>[
              const Divider(height: AppSpacing.xl),
              Text(otherText, style: secondary, textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }

  static CardLanguage _other(CardLanguage language) => switch (language) {
    CardLanguage.en => CardLanguage.es,
    CardLanguage.es => CardLanguage.en,
  };
}
