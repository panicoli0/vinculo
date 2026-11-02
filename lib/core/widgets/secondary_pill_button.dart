import 'package:flutter/material.dart';

/// Full-width outlined pill button for a secondary action.
final class SecondaryPillButton extends StatelessWidget {
  /// Creates the button.
  const SecondaryPillButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  /// Localized text of the button.
  final String label;

  /// Called on tap; a null value disables the button.
  final VoidCallback? onPressed;

  /// Optional icon shown before the [label].
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final IconData? iconData = icon;
    return SizedBox(
      width: double.infinity,
      child: iconData == null
          ? OutlinedButton(onPressed: onPressed, child: Text(label))
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(iconData),
              label: Text(label),
            ),
    );
  }
}
