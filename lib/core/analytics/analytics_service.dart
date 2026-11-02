import 'analytics_event.dart';

/// Sink for analytics events.
abstract interface class AnalyticsService {
  /// Records [event].
  void log(AnalyticsEvent event);
}
