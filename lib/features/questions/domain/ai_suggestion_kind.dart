/// What the AI is asked to produce.
enum AiSuggestionKind {
  /// New questions.
  newQuestions('new'),

  /// Variations of a card.
  variation('variation');

  const AiSuggestionKind(this.wireName);

  /// Value sent on the wire; differs from the Dart identifier because `new` is
  /// a reserved word.
  final String wireName;
}
