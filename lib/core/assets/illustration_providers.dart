import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'illustration_resolver.dart';
import 'painted_illustrations.dart';

part 'illustration_providers.g.dart';

/// The active [IllustrationResolver].
///
/// Tipado como la interfaz: el arte real se enchufa con un override de este
/// provider, sin tocar ningún widget.
@Riverpod(keepAlive: true)
IllustrationResolver illustrationResolver(Ref ref) =>
    const PaintedIllustrations();
