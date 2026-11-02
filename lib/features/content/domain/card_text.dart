import 'package:freezed_annotation/freezed_annotation.dart';

import 'card_language.dart';
import 'formality.dart';

part 'card_text.freezed.dart';
part 'card_text.g.dart';

/// Text of a card in both languages, with an optional formal Spanish variant.
@freezed
abstract class CardText with _$CardText {
  /// Creates a [CardText]; [esUsted] is null when [es] already serves both forms.
  const factory CardText({
    required String en,
    required String es,
    String? esUsted,
  }) = _CardText;

  const CardText._();

  /// Parses a [CardText] from deck JSON.
  factory CardText.fromJson(Map<String, dynamic> json) =>
      _$CardTextFromJson(json);

  /// Returns the text for [language] and [formality]. The "usted" form falls
  /// back to [es] when [esUsted] is null or blank after trimming, so a blank
  /// value is treated as absent rather than rendered as an empty card.
  String resolve(CardLanguage language, Formality formality) =>
      switch ((language, formality)) {
        (CardLanguage.en, _) => en,
        (CardLanguage.es, Formality.tu) => es,
        (CardLanguage.es, Formality.usted) => _usted ?? es,
      };

  /// [esUsted] when it has visible content, null otherwise.
  String? get _usted {
    final String? candidate = esUsted;
    return candidate == null || candidate.trim().isEmpty ? null : candidate;
  }
}
