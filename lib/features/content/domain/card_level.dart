import 'package:json_annotation/json_annotation.dart';

/// Depth of a card; serialized as the integer [value] used in the deck file.
@JsonEnum(valueField: 'value')
enum CardLevel {
  /// Light cards to get the conversation started (level 1).
  warmUp(1),

  /// More personal cards (level 2).
  deeper(2);

  const CardLevel(this.value);

  /// Integer used in the deck content file.
  final int value;

  /// Returns the level whose [value] equals [raw]; throws [ArgumentError] if none.
  static CardLevel fromValue(int raw) {
    for (final CardLevel level in CardLevel.values) {
      if (level.value == raw) {
        return level;
      }
    }
    throw ArgumentError.value(raw, 'raw', 'Unknown card level');
  }
}
