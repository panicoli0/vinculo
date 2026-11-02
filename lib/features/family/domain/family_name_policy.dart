/// Shortest accepted family name, after trimming (`families.name`).
const int kFamilyNameMinLength = 1;

/// Longest accepted family name, after trimming (`families.name`).
const int kFamilyNameMaxLength = 40;

/// Whether [raw] is acceptable as a family name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
bool isValidFamilyName(String raw) {
  final int length = raw.trim().length;
  return length >= kFamilyNameMinLength && length <= kFamilyNameMaxLength;
}
