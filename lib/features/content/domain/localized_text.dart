import 'package:freezed_annotation/freezed_annotation.dart';

import 'card_language.dart';

part 'localized_text.freezed.dart';
part 'localized_text.g.dart';

/// A text available in English and Spanish.
@freezed
abstract class LocalizedText with _$LocalizedText {
  /// Creates a [LocalizedText].
  const factory LocalizedText({required String en, required String es}) =
      _LocalizedText;

  const LocalizedText._();

  /// Parses a [LocalizedText] from deck JSON.
  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);

  /// Returns the text in [language].
  String resolve(CardLanguage language) => switch (language) {
    CardLanguage.en => en,
    CardLanguage.es => es,
  };
}
