/// Result of an AI suggestion request.
enum AiSuggestionOutcome {
  /// Suggestions were produced.
  ok,

  /// The curated fallback was served instead.
  fallback,

  /// The quota was exhausted.
  quotaExceeded,

  /// The request failed.
  error,
}
