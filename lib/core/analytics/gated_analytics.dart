import 'analytics_event.dart';
import 'analytics_service.dart';

/// [AnalyticsService] that forwards to [delegate] only while [enabled].
///
/// Implements the privacy rule of docs/analytics.md §1: without consent nothing
/// is sent. It trusts [enabled] as given: until Phase 6 that only reflects the
/// consent, and from Phase 6 whoever resolves it must also require an adult
/// account.
final class GatedAnalytics implements AnalyticsService {
  /// Creates a gate in front of [delegate].
  const GatedAnalytics({required this.delegate, required this.enabled});

  /// Service receiving the events that pass the gate.
  final AnalyticsService delegate;

  /// Whether analytics may be sent (consent today; consent and an adult
  /// account from Phase 6).
  final bool enabled;

  @override
  void log(AnalyticsEvent event) {
    if (enabled) {
      delegate.log(event);
    }
  }
}
