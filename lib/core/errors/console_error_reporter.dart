import 'dart:developer' as developer;

import 'error_reporter.dart';

/// [ErrorReporter] that writes to the developer log.
final class ConsoleErrorReporter implements ErrorReporter {
  /// Creates a [ConsoleErrorReporter].
  const ConsoleErrorReporter();

  @override
  void reportNonFatal(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
    Map<String, Object?> context = const <String, Object?>{},
  }) {
    developer.log(
      '$message $context',
      name: 'error',
      error: cause,
      stackTrace: stackTrace,
    );
  }
}
