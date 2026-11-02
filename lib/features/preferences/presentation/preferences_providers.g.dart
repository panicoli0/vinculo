// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The [PreferencesRepository]; must be overridden in bootstrap.

@ProviderFor(preferencesRepository)
final preferencesRepositoryProvider = PreferencesRepositoryProvider._();

/// The [PreferencesRepository]; must be overridden in bootstrap.

final class PreferencesRepositoryProvider
    extends
        $FunctionalProvider<
          PreferencesRepository,
          PreferencesRepository,
          PreferencesRepository
        >
    with $Provider<PreferencesRepository> {
  /// The [PreferencesRepository]; must be overridden in bootstrap.
  PreferencesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesRepositoryHash();

  @$internal
  @override
  $ProviderElement<PreferencesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PreferencesRepository create(Ref ref) {
    return preferencesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreferencesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreferencesRepository>(value),
    );
  }
}

String _$preferencesRepositoryHash() =>
    r'e63aac3fa188b895dd057881e0dc3d4713597257';

/// Preferences loaded once at startup so the router can redirect synchronously.
/// Must be overridden in bootstrap.

@ProviderFor(initialPreferences)
final initialPreferencesProvider = InitialPreferencesProvider._();

/// Preferences loaded once at startup so the router can redirect synchronously.
/// Must be overridden in bootstrap.

final class InitialPreferencesProvider
    extends
        $FunctionalProvider<
          DevicePreferences,
          DevicePreferences,
          DevicePreferences
        >
    with $Provider<DevicePreferences> {
  /// Preferences loaded once at startup so the router can redirect synchronously.
  /// Must be overridden in bootstrap.
  InitialPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialPreferencesHash();

  @$internal
  @override
  $ProviderElement<DevicePreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DevicePreferences create(Ref ref) {
    return initialPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DevicePreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DevicePreferences>(value),
    );
  }
}

String _$initialPreferencesHash() =>
    r'ec2d289980e7a399f45297c5404ffca4d0b5092c';

/// Current [DevicePreferences], persisted through the [PreferencesRepository].

@ProviderFor(PreferencesController)
final preferencesControllerProvider = PreferencesControllerProvider._();

/// Current [DevicePreferences], persisted through the [PreferencesRepository].
final class PreferencesControllerProvider
    extends $NotifierProvider<PreferencesController, DevicePreferences> {
  /// Current [DevicePreferences], persisted through the [PreferencesRepository].
  PreferencesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesControllerHash();

  @$internal
  @override
  PreferencesController create() => PreferencesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DevicePreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DevicePreferences>(value),
    );
  }
}

String _$preferencesControllerHash() =>
    r'51d9b3cd45ca881925526991ab7755f236148584';

/// Current [DevicePreferences], persisted through the [PreferencesRepository].

abstract class _$PreferencesController extends $Notifier<DevicePreferences> {
  DevicePreferences build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DevicePreferences, DevicePreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DevicePreferences, DevicePreferences>,
              DevicePreferences,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
