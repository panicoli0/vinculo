import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_environment.dart';

part 'app_config.freezed.dart';

/// Build-time configuration read from `--dart-define-from-file`.
@freezed
abstract class AppConfig with _$AppConfig {
  /// Creates an [AppConfig].
  const factory AppConfig({
    /// Raw `ENVIRONMENT` value; read the typed [AppConfig.environment] instead.
    required String environmentRaw,

    /// Whether Firebase is initialised; off means the in-memory repositories.
    required bool useFirebase,

    /// Whether Auth, Firestore and Functions target the local emulators.
    required bool useEmulators,

    /// Host serving the App Links / Universal Links files and invite pages.
    required String inviteLinkHost,

    /// Public URL of the privacy policy.
    required String privacyPolicyUrl,

    /// Contact address shown in Settings.
    required String supportEmail,

    /// Whether profiles for under-13 members can be created. Stays off until
    /// legal defines the parental verification method.
    required bool under13ProfilesEnabled,

    /// OAuth client id of the Firebase project's web client, used as the
    /// Google `serverClientId`; empty takes it from `google-services.json`.
    required String googleServerClientId,

    /// Apple Service ID; only Sign in with Apple on Android needs it.
    required String appleServiceId,

    /// Redirect URI registered for the Apple Service ID; only Sign in with
    /// Apple on Android needs it.
    required String appleRedirectUri,
  }) = _AppConfig;

  const AppConfig._();

  /// Target environment, parsed from the `ENVIRONMENT` dart-define.
  AppEnvironment get environment => AppEnvironment.fromWireName(environmentRaw);

  /// Values from the compile-time environment; Firebase is off unless enabled.
  static const AppConfig fromEnvironment = AppConfig(
    environmentRaw: String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev'),
    useFirebase: bool.fromEnvironment('USE_FIREBASE'),
    useEmulators: bool.fromEnvironment('USE_EMULATORS'),
    inviteLinkHost: String.fromEnvironment('INVITE_LINK_HOST'),
    privacyPolicyUrl: String.fromEnvironment('PRIVACY_POLICY_URL'),
    supportEmail: String.fromEnvironment('SUPPORT_EMAIL'),
    under13ProfilesEnabled: bool.fromEnvironment('UNDER13_PROFILES_ENABLED'),
    googleServerClientId: String.fromEnvironment('GOOGLE_SERVER_CLIENT_ID'),
    appleServiceId: String.fromEnvironment('APPLE_SERVICE_ID'),
    appleRedirectUri: String.fromEnvironment('APPLE_REDIRECT_URI'),
  );
}
