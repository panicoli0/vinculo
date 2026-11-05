import 'package:characters/characters.dart';

/// Shortest accepted family name, in grapheme clusters, after trimming
/// (`families.name`).
const int kFamilyNameMinLength = 1;

/// Longest accepted family name, in grapheme clusters, after trimming
/// (`families.name`).
const int kFamilyNameMaxLength = 40;

/// Whether [raw] is acceptable as a family name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
///
/// Cuenta **grafemas**, no `String.length`: el campo recorta con
/// `LengthLimitingTextInputFormatter`, que también cuenta grafemas, y
/// contar unidades UTF-16 acá dejaría pasar nombres que el campo acepta
/// ("Familia 👨‍👩‍👧‍👦") pero que esta función rechaza, con el botón de crear
/// apagado y sin ninguna explicación en pantalla.
bool isValidFamilyName(String raw) {
  final int length = raw.trim().characters.length;
  return length >= kFamilyNameMinLength && length <= kFamilyNameMaxLength;
}
