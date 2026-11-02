import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

import '../errors/app_failure.dart';

/// Detail a Cloud Function attaches to a `failed-precondition` error when an
/// invite or minor code is unknown, expired or already used.
const String _invalidCodeDetail = 'invalid-code';

/// Whether [details] carries the invalid-code marker, either as the bare
/// string or as a `{ reason: ... }` map.
///
/// `details` llega como `dynamic` desde el SDK; se aceptan las dos formas que
/// una Function puede lanzar para que un desajuste no degrade en silencio a
/// [AppFailure.unexpected].
bool _isInvalidCode(Object? details) => switch (details) {
  _invalidCodeDetail => true,
  {'reason': _invalidCodeDetail} => true,
  _ => false,
};

/// Translates a Firebase [error] (Auth, Firestore or a callable Function) into
/// the [AppFailure] the domain layer understands.
///
/// El `switch` es sobre el `code` del SDK; todo lo que no tiene un caso propio
/// termina en [AppFailure.unexpected]. Siempre se conservan [error] como
/// `cause` y [stackTrace], para que nada se trague.
AppFailure mapFirebaseError(Object error, StackTrace stackTrace) {
  if (error is! FirebaseException) {
    return AppFailure.unexpected(
      message: error.toString(),
      cause: error,
      stackTrace: stackTrace,
    );
  }
  final String message = error.message ?? error.code;
  return switch (error.code) {
    'unauthenticated' || 'permission-denied' => AppFailure.permissionDenied(
      message: message,
      cause: error,
      stackTrace: stackTrace,
    ),
    'unavailable' ||
    'deadline-exceeded' ||
    'network-request-failed' => AppFailure.network(
      message: message,
      cause: error,
      stackTrace: stackTrace,
    ),
    'not-found' => AppFailure.notFound(
      message: message,
      cause: error,
      stackTrace: stackTrace,
    ),
    'resource-exhausted' => AppFailure.quotaExceeded(
      message: message,
      cause: error,
      stackTrace: stackTrace,
    ),
    'failed-precondition'
        when error is FirebaseFunctionsException &&
            _isInvalidCode(error.details) =>
      AppFailure.invalidCode(
        message: message,
        cause: error,
        stackTrace: stackTrace,
      ),
    _ => AppFailure.unexpected(
      message: message,
      cause: error,
      stackTrace: stackTrace,
    ),
  };
}
