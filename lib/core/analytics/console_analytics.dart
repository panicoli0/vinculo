import 'dart:developer' as developer;

import 'analytics_event.dart';
import 'analytics_service.dart';

/// [AnalyticsService] that writes events to the developer log.
final class ConsoleAnalytics implements AnalyticsService {
  /// Creates a [ConsoleAnalytics].
  const ConsoleAnalytics();

  @override
  void log(AnalyticsEvent event) {
    developer.log('${event.name} ${event.parameters}', name: 'analytics');
  }
}
