/// Outcome of checking a birth year against the age thresholds (spec §3.1).
enum AgeCheck {
  /// The minimum possible age reaches [kAdultAge]: may create an account.
  adult,

  /// Minor who does not need parental consent.
  minor,

  /// Minor below the age of parental consent.
  minorUnderConsentAge,
}
