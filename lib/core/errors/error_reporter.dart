/// Sink for non-fatal errors; Crashlytics replaces the console one in Phase 6.
abstract interface class ErrorReporter {
  /// Reports a recoverable problem described by [message], with the optional
  /// [cause], [stackTrace] and extra [context] for diagnosis.
  void reportNonFatal(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
    Map<String, Object?> context = const <String, Object?>{},
  });
}
