import 'package:flutter/widgets.dart';

import 'app_illustration.dart';

/// Turns an [AppIllustration] into a widget.
///
/// The single seam for art: the default implementation paints shapes, and real
/// art later is another implementation behind the same provider.
abstract interface class IllustrationResolver {
  /// Builds [illustration] as a square of [size] logical pixels.
  Widget build(
    BuildContext context,
    AppIllustration illustration, {
    required double size,
  });
}
