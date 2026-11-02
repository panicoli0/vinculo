/// Shortest accepted display name, after trimming (`users.displayName`).
const int kDisplayNameMinLength = 1;

/// Longest accepted display name, after trimming (`users.displayName`).
const int kDisplayNameMaxLength = 40;

/// Whether [raw] is acceptable as a display name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
bool isValidDisplayName(String raw) {
  final int length = raw.trim().length;
  return length >= kDisplayNameMinLength && length <= kDisplayNameMaxLength;
}
