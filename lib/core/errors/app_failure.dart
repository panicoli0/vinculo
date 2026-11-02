import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

/// Typed failure carrying the originating [cause] so nothing is swallowed.
@freezed
sealed class AppFailure with _$AppFailure implements Exception {
  /// Sign-in, token refresh or re-authentication failed.
  const factory AppFailure.auth({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = AuthFailure;

  /// The device is offline or the request timed out.
  const factory AppFailure.network({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = NetworkFailure;

  /// Firestore or a Function rejected the caller.
  const factory AppFailure.permissionDenied({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = PermissionDeniedFailure;

  /// The requested document or resource does not exist.
  const factory AppFailure.notFound({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = NotFoundFailure;

  /// An invite or minor code is unknown, expired or already used.
  const factory AppFailure.invalidCode({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = InvalidCodeFailure;

  /// A per-user or per-family quota is exhausted.
  const factory AppFailure.quotaExceeded({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = QuotaExceededFailure;

  /// Deck content could not be found, loaded or parsed.
  const factory AppFailure.content({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = ContentFailure;

  /// Local persistence failed.
  const factory AppFailure.storage({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = StorageFailure;

  /// Anything not covered by a more specific failure.
  const factory AppFailure.unexpected({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) = UnexpectedFailure;
}
