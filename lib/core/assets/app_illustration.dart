/// Every illustration the UI can ask for.
///
/// Decorative values (the mascots and the tree) are drawn without semantics by
/// default; meaningful ones (garden stages and state illustrations) should be
/// given a semantics label by the caller.
enum AppIllustration {
  /// Sprout mascot waving hello (welcome and home hero).
  mascotWaving,

  /// Sprout mascot sitting calmly (secondary hero).
  mascotSitting,

  /// Tree with a heart in its canopy.
  tree,

  /// Conversation Garden, first stage: a seed just planted.
  gardenStage1,

  /// Conversation Garden, second stage: a young sprout.
  gardenStage2,

  /// Conversation Garden, third stage: a sapling.
  gardenStage3,

  /// Conversation Garden, fourth stage: a small tree.
  gardenStage4,

  /// Conversation Garden, fifth stage: a tree in bloom.
  gardenStage5,

  /// Empty state of the favorites list.
  emptyFavorites,

  /// Celebration shown when the whole deck has been seen.
  deckComplete,

  /// Friendly state for a route that does not exist.
  notFound,
}
