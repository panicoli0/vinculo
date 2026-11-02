/// Reason a push notification was sent.
enum PushKind {
  /// A new question arrived.
  ask,

  /// A story was told.
  story,

  /// A listener note was added.
  note,

  /// A milestone was reached.
  milestone,

  /// Someone joined the family.
  joined,
}
