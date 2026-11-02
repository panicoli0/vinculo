// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'illustration_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The active [IllustrationResolver].
///
/// Tipado como la interfaz: el arte real se enchufa con un override de este
/// provider, sin tocar ningún widget.

@ProviderFor(illustrationResolver)
final illustrationResolverProvider = IllustrationResolverProvider._();

/// The active [IllustrationResolver].
///
/// Tipado como la interfaz: el arte real se enchufa con un override de este
/// provider, sin tocar ningún widget.

final class IllustrationResolverProvider
    extends
        $FunctionalProvider<
          IllustrationResolver,
          IllustrationResolver,
          IllustrationResolver
        >
    with $Provider<IllustrationResolver> {
  /// The active [IllustrationResolver].
  ///
  /// Tipado como la interfaz: el arte real se enchufa con un override de este
  /// provider, sin tocar ningún widget.
  IllustrationResolverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'illustrationResolverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$illustrationResolverHash();

  @$internal
  @override
  $ProviderElement<IllustrationResolver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IllustrationResolver create(Ref ref) {
    return illustrationResolver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IllustrationResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IllustrationResolver>(value),
    );
  }
}

String _$illustrationResolverHash() =>
    r'6d3b5985228431f4ffa8eabecf61b4ff65e671ad';
