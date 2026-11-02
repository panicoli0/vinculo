// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether analytics may be sent.
///
/// Today this is only the user's consent; from Phase 6 it also requires an
/// adult account (docs/analytics.md §1).
///
/// Lo resuelve el bootstrap observando las preferencias: así core/ no importa
/// nada de features/presentation/ y Ajustes no crea un ciclo de imports.

@ProviderFor(analyticsEnabled)
final analyticsEnabledProvider = AnalyticsEnabledProvider._();

/// Whether analytics may be sent.
///
/// Today this is only the user's consent; from Phase 6 it also requires an
/// adult account (docs/analytics.md §1).
///
/// Lo resuelve el bootstrap observando las preferencias: así core/ no importa
/// nada de features/presentation/ y Ajustes no crea un ciclo de imports.

final class AnalyticsEnabledProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether analytics may be sent.
  ///
  /// Today this is only the user's consent; from Phase 6 it also requires an
  /// adult account (docs/analytics.md §1).
  ///
  /// Lo resuelve el bootstrap observando las preferencias: así core/ no importa
  /// nada de features/presentation/ y Ajustes no crea un ciclo de imports.
  AnalyticsEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsEnabledProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsEnabledHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return analyticsEnabled(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$analyticsEnabledHash() => r'44e64276fa6a76f13b89b42556cfd6fd306ef5be';

/// The active [AnalyticsService] (console until Phase 6), gated by
/// [analyticsEnabledProvider] so nothing is sent without consent
/// (docs/analytics.md §1).

@ProviderFor(analyticsService)
final analyticsServiceProvider = AnalyticsServiceProvider._();

/// The active [AnalyticsService] (console until Phase 6), gated by
/// [analyticsEnabledProvider] so nothing is sent without consent
/// (docs/analytics.md §1).

final class AnalyticsServiceProvider
    extends
        $FunctionalProvider<
          AnalyticsService,
          AnalyticsService,
          AnalyticsService
        >
    with $Provider<AnalyticsService> {
  /// The active [AnalyticsService] (console until Phase 6), gated by
  /// [analyticsEnabledProvider] so nothing is sent without consent
  /// (docs/analytics.md §1).
  AnalyticsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsServiceHash();

  @$internal
  @override
  $ProviderElement<AnalyticsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsService create(Ref ref) {
    return analyticsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsService>(value),
    );
  }
}

String _$analyticsServiceHash() => r'8c7df01b48a54b0f203e7b0fcf7e1b81d51a118e';
