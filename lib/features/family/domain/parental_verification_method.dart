/// How the guardian of a minor was verified.
///
/// [PENDIENTE LEGAL] (spec §3.3): el método para menores de 13 no está
/// definido; cuando legal lo defina se agregan sus valores acá.
enum ParentalVerificationMethod {
  /// An adult of the family confirmed being so (minors of 13 to 17).
  guardianAttestation,
}
