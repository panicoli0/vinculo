import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_config.dart';

part 'app_config_providers.g.dart';

/// The build-time [AppConfig].
@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) => AppConfig.fromEnvironment;

/// The installed app version as `version (build)`, e.g. `1.0.0 (1)`.
@Riverpod(keepAlive: true)
Future<String> appVersion(Ref ref) async {
  final PackageInfo info = await PackageInfo.fromPlatform();
  return '${info.version} (${info.buildNumber})';
}
