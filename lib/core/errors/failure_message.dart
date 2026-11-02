import '../i18n/translations.g.dart';
import 'app_failure.dart';

/// Short localized message for [failure], to show where an action failed.
///
/// Un corte de red tiene su propio texto; todo lo demás usa el genérico (spec
/// §10: `error.network` / `error.generic`).
String failureMessage(Translations t, AppFailure failure) => switch (failure) {
  NetworkFailure() => t.errors.network,
  AuthFailure() ||
  PermissionDeniedFailure() ||
  NotFoundFailure() ||
  InvalidCodeFailure() ||
  QuotaExceededFailure() ||
  ContentFailure() ||
  StorageFailure() ||
  UnexpectedFailure() => t.errors.generic,
};
