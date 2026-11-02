import 'package:flutter/material.dart';

/// Full-width filled pill button for the main action of a screen.
///
/// Shows a progress indicator in place of the icon while [isBusy] and ignores
/// taps until it ends. The label stays, so screen readers keep announcing it.
final class PrimaryPillButton extends StatelessWidget {
  /// Creates the button.
  const PrimaryPillButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isBusy = false,
    super.key,
  });

  /// Localized text of the button.
  final String label;

  /// Called on tap; a null value disables the button.
  final VoidCallback? onPressed;

  /// Optional icon shown before the [label].
  final IconData? icon;

  /// Whether an operation is in progress; disables the button.
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final IconData? iconData = icon;
    final Widget? leading = isBusy
        ? const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          )
        : iconData == null
        ? null
        : Icon(iconData);
    final VoidCallback? action = isBusy ? null : onPressed;
    return SizedBox(
      width: double.infinity,
      child: leading == null
          ? FilledButton(onPressed: action, child: Text(label))
          : FilledButton.icon(
              onPressed: action,
              icon: leading,
              label: Text(label),
            ),
    );
  }
}
