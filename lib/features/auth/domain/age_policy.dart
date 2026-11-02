import 'age_check.dart';

/// Minimum possible age from which a person is an adult (spec §3.1).
const int kAdultAge = 18;

/// Minimum possible age below which parental consent is required.
///
/// [PENDIENTE LEGAL] puede subir por país (GDPR-K: 13 a 16).
const int kParentalConsentAge = 13;

/// How long the device stays locked out after the age gate rejects a minor.
const Duration kAgeGateLock = Duration(hours: 24);

/// Age rules of spec §3.1, in pure Dart so any layer can use them.
abstract final class AgePolicy {
  /// Youngest age the person can have in [currentYear] given [birthYear].
  ///
  /// Solo se conoce el año: se resta uno de más para que nadie que pueda tener
  /// 12 quede contado como de 13.
  static int minimumAge({required int birthYear, required int currentYear}) =>
      currentYear - birthYear - 1;

  /// Classifies [birthYear] as of [currentYear].
  static AgeCheck evaluate({required int birthYear, required int currentYear}) {
    return switch (minimumAge(birthYear: birthYear, currentYear: currentYear)) {
      < kParentalConsentAge => AgeCheck.minorUnderConsentAge,
      < kAdultAge => AgeCheck.minor,
      _ => AgeCheck.adult,
    };
  }
}
