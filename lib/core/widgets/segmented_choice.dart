import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Single-choice [SegmentedButton] over the values of an enum.
///
/// Stacks its segments vertically when the text scale is large, so a label is
/// never clipped (spec §8).
final class SegmentedChoice<T extends Enum> extends StatelessWidget {
  /// Creates a choice over [values] with [selected] highlighted.
  const SegmentedChoice({
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
    this.semanticsLabel,
    super.key,
  });

  /// Options to offer, in display order.
  final List<T> values;

  /// Currently chosen option.
  final T selected;

  /// Localized label of an option.
  final String Function(T value) labelOf;

  /// Called with the newly chosen option.
  final ValueChanged<T> onChanged;

  /// Optional name of the whole group, announced by screen readers.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final Widget choice = SegmentedButton<T>(
      // Con texto grande los segmentos horizontales recortan la etiqueta en
      // silencio: se apilan.
      direction:
          MediaQuery.textScalerOf(context).scale(1) >
              AppSpacing.verticalLayoutTextScale
          ? Axis.vertical
          : Axis.horizontal,
      showSelectedIcon: false,
      segments: <ButtonSegment<T>>[
        for (final T value in values)
          ButtonSegment<T>(value: value, label: Text(labelOf(value))),
      ],
      selected: <T>{selected},
      onSelectionChanged: (Set<T> selection) => onChanged(selection.first),
    );
    final String? label = semanticsLabel;
    return label == null
        ? choice
        : Semantics(container: true, label: label, child: choice);
  }
}
