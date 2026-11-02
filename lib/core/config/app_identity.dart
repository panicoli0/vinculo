/// Brand name of the app, shown in the launcher, the app bar and store copy.
abstract final class AppIdentity {
  /// Product name.
  ///
  /// Locale-invariant on purpose: it is a proper noun, not a translation, so it
  /// is the one user-visible string that does not go through slang. A single
  /// constant means the two locale files can never disagree on it.
  // Provisional hasta la decisión #4 del PO (nombre de tienda).
  static const String name = 'Vínculo';
}
