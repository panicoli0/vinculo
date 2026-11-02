import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Settings row that shows the current [value] of an enum and lets the user
/// pick another one from a dialog.
///
/// Un diálogo con radios escala mejor con texto al 200% y etiquetas largas que
/// un `SegmentedButton`.
class ChoiceSettingTile<T extends Enum> extends StatelessWidget {
  /// Creates a tile titled [title] offering [options].
  const ChoiceSettingTile({
    required this.title,
    required this.value,
    required this.options,
    required this.labelOf,
    required this.onChanged,
    super.key,
  });

  /// Localized name of the setting; also the dialog title.
  final String title;

  /// Currently selected option.
  final T value;

  /// Every option the user can pick, in display order.
  final List<T> options;

  /// Localized label of an option.
  final String Function(T option) labelOf;

  /// Called only when the user picks an option different from [value].
  final ValueChanged<T> onChanged;

  Future<void> _pick(BuildContext context) async {
    final T? picked = await showDialog<T>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(title),
        contentPadding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        content: SingleChildScrollView(
          child: RadioGroup<T>(
            groupValue: value,
            onChanged: (T? option) => Navigator.of(dialogContext).pop(option),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final T option in options)
                  RadioListTile<T>(value: option, title: Text(labelOf(option))),
              ],
            ),
          ),
        ),
      ),
    );
    // Si la ruta se cerró con el diálogo abierto, `onChanged` usaría un
    // contexto y un ref ya desmontados.
    if (!context.mounted || picked == null || picked == value) return;
    onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(labelOf(value)),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: () => _pick(context),
    );
  }
}
