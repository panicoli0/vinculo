import 'package:characters/characters.dart';

/// Shortest accepted family name, in grapheme clusters, after trimming
/// (`families.name`).
const int kFamilyNameMinLength = 1;

/// Longest accepted family name, in grapheme clusters, after trimming
/// (`families.name`).
const int kFamilyNameMaxLength = 40;

/// Longest accepted family name in UTF-16 code units; the storage sanity
/// bound the Firestore rule applies to `families.name` on create and update.
///
/// La regla lo mide sobre el valor crudo, porque es el crudo el que se guarda;
/// el cliente lo mide sobre el trimeado, que es lo que va a escribir.
const int kFamilyNameMaxUtf16Units = 640;

/// Whether [raw] is acceptable as a family name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
///
/// Hay dos límites porque hay dos formas de contar. El límite de producto son
/// 40 **grafemas**: es lo que recorta `LengthLimitingTextInputFormatter` en el
/// campo, y contar unidades UTF-16 acá dejaría pasar nombres que el campo
/// acepta ("Familia 👨‍👩‍👧‍👦") pero que esta función rechaza, con el botón de
/// crear apagado y sin ninguna explicación en pantalla. El segundo límite
/// existe porque `size()` en `firestore.rules` cuenta unidades UTF-16 y no sabe
/// contar grafemas, así que la regla aplica una cota de almacenamiento de 640
/// unidades: la misma que `displayName`, arbitraria y holgada, que no se deriva
/// de los 40 grafemas. Con emoji RGI la cota es inalcanzable (peor secuencia
/// medida 15 unidades: 40 grafemas = 600), pero las marcas combinantes dejan
/// las unidades por grafema sin cota superior — Zalgo la pasa en 40 grafemas —
/// y por eso se verifica acá en vez de confiar en el formatter del campo.
///
/// El nombre de solo espacios lo cierra únicamente esta función: la regla mide
/// el valor crudo y no trimea, así que `"   "` le parece un nombre válido.
bool isValidFamilyName(String raw) {
  final String trimmed = raw.trim();
  final int graphemes = trimmed.characters.length;
  return graphemes >= kFamilyNameMinLength &&
      graphemes <= kFamilyNameMaxLength &&
      trimmed.length <= kFamilyNameMaxUtf16Units;
}
