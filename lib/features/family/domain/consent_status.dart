/// Parental consent state of a minor (data_model §3).
enum ConsentStatus {
  /// The minor is old enough that no parental consent is needed.
  notRequired,

  /// A guardian gave consent.
  granted,
}
