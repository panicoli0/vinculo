/// Spacing scale shared across the UI, in logical pixels.
abstract final class AppSpacing {
  /// Extra small spacing.
  static const double xs = 4;

  /// Small spacing.
  static const double sm = 8;

  /// Medium spacing.
  static const double md = 16;

  /// Large spacing.
  static const double lg = 24;

  /// Extra large spacing.
  static const double xl = 32;

  /// Minimum touch target for primary actions, in logical pixels (spec §8).
  static const double minTouchTarget = 56;

  /// Text scale above which segmented controls stack vertically, so a segment
  /// label never gets clipped (spec §8).
  static const double verticalLayoutTextScale = 1.3;
}
