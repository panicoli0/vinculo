import 'package:characters/characters.dart';

/// Shortest accepted display name, in grapheme clusters, after trimming
/// (`users.displayName`).
const int kDisplayNameMinLength = 1;

/// Longest accepted display name, in grapheme clusters, after trimming
/// (`users.displayName`).
const int kDisplayNameMaxLength = 40;

/// Longest accepted display name in UTF-16 code units; the storage sanity
/// bound the Firestore rule applies to `users.displayName` and
/// `families/{fid}/members/{uid}.displayName`.
///
/// La regla lo mide sobre el valor crudo, porque es el crudo el que se guarda;
/// el cliente lo mide sobre el trimeado, que es lo que va a escribir.
const int kDisplayNameMaxUtf16Units = 640;

/// Whether [raw] is acceptable as a display name once trimmed; mirrors the
/// Firestore rule so the client never sends a write the rules would reject.
///
/// Hay dos límites porque hay dos formas de contar. El límite de producto son
/// 40 **grafemas**: es lo que recorta `LengthLimitingTextInputFormatter` en el
/// campo, y contar unidades UTF-16 acá dejaría pasar nombres que el campo
/// acepta ("Ana 👨‍👩‍👧‍👦") pero que esta función rechaza, con el botón de
/// continuar apagado y sin ninguna explicación en pantalla. El segundo límite
/// existe porque `size()` en `firestore.rules` cuenta unidades UTF-16 y no sabe
/// contar grafemas, así que la regla aplica una cota de almacenamiento de 640
/// unidades: un número arbitrario, holgado por encima de cualquier nombre real,
/// que no se deriva de los 40 grafemas. No hay margen que recalcular — ningún
/// multiplicador es demostrablemente seguro, porque las marcas combinantes
/// dejan las unidades UTF-16 por grafema sin cota superior. Con emoji RGI la
/// cota es inalcanzable (peor secuencia medida 15 unidades: 40 grafemas = 600),
/// pero Zalgo llega a 840 unidades en 40 grafemas sin esfuerzo, y por eso se
/// verifica acá en vez de confiar en el formatter del campo. Validar las dos
/// acá es lo que garantiza que el cliente nunca mande un write que la regla
/// rechace.
bool isValidDisplayName(String raw) {
  final String trimmed = raw.trim();
  final int graphemes = trimmed.characters.length;
  return graphemes >= kDisplayNameMinLength &&
      graphemes <= kDisplayNameMaxLength &&
      trimmed.length <= kDisplayNameMaxUtf16Units;
}
