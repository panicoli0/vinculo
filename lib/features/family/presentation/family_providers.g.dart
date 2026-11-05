// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The [FamilyRepository]; must be overridden in bootstrap.

@ProviderFor(familyRepository)
final familyRepositoryProvider = FamilyRepositoryProvider._();

/// The [FamilyRepository]; must be overridden in bootstrap.

final class FamilyRepositoryProvider
    extends
        $FunctionalProvider<
          FamilyRepository,
          FamilyRepository,
          FamilyRepository
        >
    with $Provider<FamilyRepository> {
  /// The [FamilyRepository]; must be overridden in bootstrap.
  FamilyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'familyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$familyRepositoryHash();

  @$internal
  @override
  $ProviderElement<FamilyRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FamilyRepository create(Ref ref) {
    return familyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FamilyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FamilyRepository>(value),
    );
  }
}

String _$familyRepositoryHash() => r'5dc714c27ef647d5ef6f9a23845692c3d96edee3';

/// Families the signed-in person belongs to; empty while there is none.
///
/// Composición entre features, permitida solo acá (en
/// `presentation/*_providers.dart`): la lista depende de quién esté dentro.
///
/// Con el reintento por defecto de Riverpod, a diferencia de `currentUser`:
/// un *listen* de Firestore que falla no vuelve a emitir nunca más, así que
/// sin reintento la consulta queda muerta hasta reiniciar la app, aunque se
/// corrija la causa. Volver a suscribir es lo único que la revive.

@ProviderFor(currentFamilies)
final currentFamiliesProvider = CurrentFamiliesProvider._();

/// Families the signed-in person belongs to; empty while there is none.
///
/// Composición entre features, permitida solo acá (en
/// `presentation/*_providers.dart`): la lista depende de quién esté dentro.
///
/// Con el reintento por defecto de Riverpod, a diferencia de `currentUser`:
/// un *listen* de Firestore que falla no vuelve a emitir nunca más, así que
/// sin reintento la consulta queda muerta hasta reiniciar la app, aunque se
/// corrija la causa. Volver a suscribir es lo único que la revive.

final class CurrentFamiliesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Family>>,
          List<Family>,
          Stream<List<Family>>
        >
    with $FutureModifier<List<Family>>, $StreamProvider<List<Family>> {
  /// Families the signed-in person belongs to; empty while there is none.
  ///
  /// Composición entre features, permitida solo acá (en
  /// `presentation/*_providers.dart`): la lista depende de quién esté dentro.
  ///
  /// Con el reintento por defecto de Riverpod, a diferencia de `currentUser`:
  /// un *listen* de Firestore que falla no vuelve a emitir nunca más, así que
  /// sin reintento la consulta queda muerta hasta reiniciar la app, aunque se
  /// corrija la causa. Volver a suscribir es lo único que la revive.
  CurrentFamiliesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentFamiliesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentFamiliesHash();

  @$internal
  @override
  $StreamProviderElement<List<Family>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Family>> create(Ref ref) {
    return currentFamilies(ref);
  }
}

String _$currentFamiliesHash() => r'7be43c7d7bc65fc7fb3c555316dc16accfd96188';
