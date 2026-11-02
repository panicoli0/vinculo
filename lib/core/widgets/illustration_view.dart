import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../assets/app_illustration.dart';
import '../assets/illustration_providers.dart';

/// Shows an [AppIllustration] through the active illustration resolver.
///
/// Decorative by default: without a [semanticsLabel] the art is hidden from
/// screen readers.
final class IllustrationView extends ConsumerWidget {
  /// Creates a view of [illustration] sized [size].
  const IllustrationView({
    required this.illustration,
    required this.size,
    this.semanticsLabel,
    super.key,
  });

  /// Which illustration to show.
  final AppIllustration illustration;

  /// Width and height of the square the art is drawn in.
  final double size;

  /// Localized description for screen readers; null marks the art decorative.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget art = ExcludeSemantics(
      child: ref
          .watch(illustrationResolverProvider)
          .build(context, illustration, size: size),
    );
    final String? label = semanticsLabel;
    return label == null
        ? art
        : Semantics(label: label, image: true, child: art);
  }
}
