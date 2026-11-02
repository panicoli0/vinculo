import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'analytics_service.dart';
import 'console_analytics.dart';
import 'gated_analytics.dart';

part 'analytics_providers.g.dart';

/// Whether analytics may be sent.
///
/// Today this is only the user's consent; from Phase 6 it also requires an
/// adult account (docs/analytics.md §1).
///
/// Lo resuelve el bootstrap observando las preferencias: así core/ no importa
/// nada de features/presentation/ y Ajustes no crea un ciclo de imports.
@Riverpod(keepAlive: true)
bool analyticsEnabled(Ref ref) => throw UnimplementedError(
  'analyticsEnabledProvider must be overridden in bootstrap',
);

/// The active [AnalyticsService] (console until Phase 6), gated by
/// [analyticsEnabledProvider] so nothing is sent without consent
/// (docs/analytics.md §1).
@Riverpod(keepAlive: true)
AnalyticsService analyticsService(Ref ref) => GatedAnalytics(
  delegate: const ConsoleAnalytics(),
  enabled: ref.watch(analyticsEnabledProvider),
);
