import 'package:characters/characters.dart';

/// Shortest accepted display name, in grapheme clusters, after trimming
/// (`users.displayName`).
const int kDisplayNameMinLength = 1;

/// Longest accepted display name, in grapheme clusters, after trimming
/// (`users.displayName`).
const int kDisplayNameMaxLength = 40;

/// Longest accepted display name in UTF-16 code units, after trimming; the
/// sanity bound the Firestore rule applies to `users.displayName` and
/// `families/{fid}/members/{uid}.displayName`.
const int kDisplayNameMaxUtf16Units = 640;

/// Whether [raw] fits the 40-grapheme product limit but not the Firestore
/// sanity bound, so the screen can say why instead of just disabling the button.
bool exceedsDisplayNameStorageLimit(String raw) =>
    raw.trim().length > kDisplayNameMaxUtf16Units;

/// Whether [raw] is acceptable as a display name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
///
/// Hay dos límites porque hay dos formas de contar. El límite de producto son
/// 40 **grafemas**: es lo que recorta `LengthLimitingTextInputFormatter` en el
/// campo, y contar unidades UTF-16 acá dejaría pasar nombres que el campo
/// acepta ("Ana 👨‍👩‍👧‍👦") pero que esta función rechaza, con el botón de
/// continuar apagado y sin ninguna explicación en pantalla. El segundo límite
/// existe porque `size()` en `firestore.rules` cuenta unidades UTF-16 y no sabe
/// contar grafemas: la regla usa una cota de sanidad de 640 = 40 x 16, con 16
/// por encima de la peor secuencia RGI medida (15 unidades). Validar las dos
/// acá es lo que garantiza que el cliente nunca mande un write que la regla
/// rechace.
bool isValidDisplayName(String raw) {
  final String trimmed = raw.trim();
  final int graphemes = trimmed.characters.length;
  return graphemes >= kDisplayNameMinLength &&
      graphemes <= kDisplayNameMaxLength &&
      trimmed.length <= kDisplayNameMaxUtf16Units;
}
