import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Converts a required Firestore date field between [Timestamp] and
/// [DateTime].
///
/// `json_serializable` no conoce [Timestamp] (data_model §1), así que cada
/// modelo con fechas anota el campo con este converter. Un valor ausente o de
/// otro tipo es un documento corrupto y falla de forma explícita; los campos
/// que pueden venir sin valor (p. ej. una escritura pendiente del servidor)
/// deben ser nullable y usar [NullableTimestampConverter].
final class TimestampConverter implements JsonConverter<DateTime, Object?> {
  /// Creates a [TimestampConverter].
  const TimestampConverter();

  @override
  DateTime fromJson(Object? json) => switch (json) {
    final Timestamp timestamp => timestamp.toDate(),
    _ => throw FormatException('Expected a Timestamp, got: $json'),
  };

  @override
  Object? toJson(DateTime object) => Timestamp.fromDate(object);
}

/// Converts an optional Firestore date field between [Timestamp] and
/// [DateTime].
///
/// Una lectura con `null` (p. ej. un `serverTimestamp()` todavía pendiente en
/// un snapshot local) se queda en `null`: nunca se resuelve con
/// `DateTime.now()`, que inventaría una fecha que el servidor no confirmó.
final class NullableTimestampConverter
    implements JsonConverter<DateTime?, Object?> {
  /// Creates a [NullableTimestampConverter].
  const NullableTimestampConverter();

  @override
  DateTime? fromJson(Object? json) => switch (json) {
    null => null,
    final Timestamp timestamp => timestamp.toDate(),
    _ => throw FormatException('Expected a Timestamp or null, got: $json'),
  };

  @override
  Object? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}
