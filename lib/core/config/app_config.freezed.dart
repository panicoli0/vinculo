// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppConfig {

/// Raw `ENVIRONMENT` value; read the typed [AppConfig.environment] instead.
 String get environmentRaw;/// Whether Firebase is initialised; off means the in-memory repositories.
 bool get useFirebase;/// Whether Auth, Firestore and Functions target the local emulators.
 bool get useEmulators;/// Host serving the App Links / Universal Links files and invite pages.
 String get inviteLinkHost;/// Public URL of the privacy policy.
 String get privacyPolicyUrl;/// Contact address shown in Settings.
 String get supportEmail;/// Whether profiles for under-13 members can be created. Stays off until
/// legal defines the parental verification method.
 bool get under13ProfilesEnabled;/// OAuth client id of the Firebase project's web client, used as the
/// Google `serverClientId`; empty takes it from `google-services.json`.
 String get googleServerClientId;/// Apple Service ID; only Sign in with Apple on Android needs it.
 String get appleServiceId;/// Redirect URI registered for the Apple Service ID; only Sign in with
/// Apple on Android needs it.
 String get appleRedirectUri;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.environmentRaw, environmentRaw) || other.environmentRaw == environmentRaw)&&(identical(other.useFirebase, useFirebase) || other.useFirebase == useFirebase)&&(identical(other.useEmulators, useEmulators) || other.useEmulators == useEmulators)&&(identical(other.inviteLinkHost, inviteLinkHost) || other.inviteLinkHost == inviteLinkHost)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.supportEmail, supportEmail) || other.supportEmail == supportEmail)&&(identical(other.under13ProfilesEnabled, under13ProfilesEnabled) || other.under13ProfilesEnabled == under13ProfilesEnabled)&&(identical(other.googleServerClientId, googleServerClientId) || other.googleServerClientId == googleServerClientId)&&(identical(other.appleServiceId, appleServiceId) || other.appleServiceId == appleServiceId)&&(identical(other.appleRedirectUri, appleRedirectUri) || other.appleRedirectUri == appleRedirectUri));
}


@override
int get hashCode => Object.hash(runtimeType,environmentRaw,useFirebase,useEmulators,inviteLinkHost,privacyPolicyUrl,supportEmail,under13ProfilesEnabled,googleServerClientId,appleServiceId,appleRedirectUri);

@override
String toString() {
  return 'AppConfig(environmentRaw: $environmentRaw, useFirebase: $useFirebase, useEmulators: $useEmulators, inviteLinkHost: $inviteLinkHost, privacyPolicyUrl: $privacyPolicyUrl, supportEmail: $supportEmail, under13ProfilesEnabled: $under13ProfilesEnabled, googleServerClientId: $googleServerClientId, appleServiceId: $appleServiceId, appleRedirectUri: $appleRedirectUri)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 String environmentRaw, bool useFirebase, bool useEmulators, String inviteLinkHost, String privacyPolicyUrl, String supportEmail, bool under13ProfilesEnabled, String googleServerClientId, String appleServiceId, String appleRedirectUri
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? environmentRaw = null,Object? useFirebase = null,Object? useEmulators = null,Object? inviteLinkHost = null,Object? privacyPolicyUrl = null,Object? supportEmail = null,Object? under13ProfilesEnabled = null,Object? googleServerClientId = null,Object? appleServiceId = null,Object? appleRedirectUri = null,}) {
  return _then(AppConfig(
environmentRaw: null == environmentRaw ? _self.environmentRaw : environmentRaw // ignore: cast_nullable_to_non_nullable
as String,useFirebase: null == useFirebase ? _self.useFirebase : useFirebase // ignore: cast_nullable_to_non_nullable
as bool,useEmulators: null == useEmulators ? _self.useEmulators : useEmulators // ignore: cast_nullable_to_non_nullable
as bool,inviteLinkHost: null == inviteLinkHost ? _self.inviteLinkHost : inviteLinkHost // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,supportEmail: null == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String,under13ProfilesEnabled: null == under13ProfilesEnabled ? _self.under13ProfilesEnabled : under13ProfilesEnabled // ignore: cast_nullable_to_non_nullable
as bool,googleServerClientId: null == googleServerClientId ? _self.googleServerClientId : googleServerClientId // ignore: cast_nullable_to_non_nullable
as String,appleServiceId: null == appleServiceId ? _self.appleServiceId : appleServiceId // ignore: cast_nullable_to_non_nullable
as String,appleRedirectUri: null == appleRedirectUri ? _self.appleRedirectUri : appleRedirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String environmentRaw,  bool useFirebase,  bool useEmulators,  String inviteLinkHost,  String privacyPolicyUrl,  String supportEmail,  bool under13ProfilesEnabled,  String googleServerClientId,  String appleServiceId,  String appleRedirectUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.environmentRaw,_that.useFirebase,_that.useEmulators,_that.inviteLinkHost,_that.privacyPolicyUrl,_that.supportEmail,_that.under13ProfilesEnabled,_that.googleServerClientId,_that.appleServiceId,_that.appleRedirectUri);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String environmentRaw,  bool useFirebase,  bool useEmulators,  String inviteLinkHost,  String privacyPolicyUrl,  String supportEmail,  bool under13ProfilesEnabled,  String googleServerClientId,  String appleServiceId,  String appleRedirectUri)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.environmentRaw,_that.useFirebase,_that.useEmulators,_that.inviteLinkHost,_that.privacyPolicyUrl,_that.supportEmail,_that.under13ProfilesEnabled,_that.googleServerClientId,_that.appleServiceId,_that.appleRedirectUri);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String environmentRaw,  bool useFirebase,  bool useEmulators,  String inviteLinkHost,  String privacyPolicyUrl,  String supportEmail,  bool under13ProfilesEnabled,  String googleServerClientId,  String appleServiceId,  String appleRedirectUri)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.environmentRaw,_that.useFirebase,_that.useEmulators,_that.inviteLinkHost,_that.privacyPolicyUrl,_that.supportEmail,_that.under13ProfilesEnabled,_that.googleServerClientId,_that.appleServiceId,_that.appleRedirectUri);case _:
  return null;

}
}

}

/// @nodoc


class _AppConfig extends AppConfig {
  const _AppConfig({required this.environmentRaw, required this.useFirebase, required this.useEmulators, required this.inviteLinkHost, required this.privacyPolicyUrl, required this.supportEmail, required this.under13ProfilesEnabled, required this.googleServerClientId, required this.appleServiceId, required this.appleRedirectUri}): super._();
  

/// Raw `ENVIRONMENT` value; read the typed [AppConfig.environment] instead.
@override final  String environmentRaw;
/// Whether Firebase is initialised; off means the in-memory repositories.
@override final  bool useFirebase;
/// Whether Auth, Firestore and Functions target the local emulators.
@override final  bool useEmulators;
/// Host serving the App Links / Universal Links files and invite pages.
@override final  String inviteLinkHost;
/// Public URL of the privacy policy.
@override final  String privacyPolicyUrl;
/// Contact address shown in Settings.
@override final  String supportEmail;
/// Whether profiles for under-13 members can be created. Stays off until
/// legal defines the parental verification method.
@override final  bool under13ProfilesEnabled;
/// OAuth client id of the Firebase project's web client, used as the
/// Google `serverClientId`; empty takes it from `google-services.json`.
@override final  String googleServerClientId;
/// Apple Service ID; only Sign in with Apple on Android needs it.
@override final  String appleServiceId;
/// Redirect URI registered for the Apple Service ID; only Sign in with
/// Apple on Android needs it.
@override final  String appleRedirectUri;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.environmentRaw, environmentRaw) || other.environmentRaw == environmentRaw)&&(identical(other.useFirebase, useFirebase) || other.useFirebase == useFirebase)&&(identical(other.useEmulators, useEmulators) || other.useEmulators == useEmulators)&&(identical(other.inviteLinkHost, inviteLinkHost) || other.inviteLinkHost == inviteLinkHost)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.supportEmail, supportEmail) || other.supportEmail == supportEmail)&&(identical(other.under13ProfilesEnabled, under13ProfilesEnabled) || other.under13ProfilesEnabled == under13ProfilesEnabled)&&(identical(other.googleServerClientId, googleServerClientId) || other.googleServerClientId == googleServerClientId)&&(identical(other.appleServiceId, appleServiceId) || other.appleServiceId == appleServiceId)&&(identical(other.appleRedirectUri, appleRedirectUri) || other.appleRedirectUri == appleRedirectUri));
}


@override
int get hashCode => Object.hash(runtimeType,environmentRaw,useFirebase,useEmulators,inviteLinkHost,privacyPolicyUrl,supportEmail,under13ProfilesEnabled,googleServerClientId,appleServiceId,appleRedirectUri);

@override
String toString() {
  return 'AppConfig(environmentRaw: $environmentRaw, useFirebase: $useFirebase, useEmulators: $useEmulators, inviteLinkHost: $inviteLinkHost, privacyPolicyUrl: $privacyPolicyUrl, supportEmail: $supportEmail, under13ProfilesEnabled: $under13ProfilesEnabled, googleServerClientId: $googleServerClientId, appleServiceId: $appleServiceId, appleRedirectUri: $appleRedirectUri)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 String environmentRaw, bool useFirebase, bool useEmulators, String inviteLinkHost, String privacyPolicyUrl, String supportEmail, bool under13ProfilesEnabled, String googleServerClientId, String appleServiceId, String appleRedirectUri
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? environmentRaw = null,Object? useFirebase = null,Object? useEmulators = null,Object? inviteLinkHost = null,Object? privacyPolicyUrl = null,Object? supportEmail = null,Object? under13ProfilesEnabled = null,Object? googleServerClientId = null,Object? appleServiceId = null,Object? appleRedirectUri = null,}) {
  return _then(_AppConfig(
environmentRaw: null == environmentRaw ? _self.environmentRaw : environmentRaw // ignore: cast_nullable_to_non_nullable
as String,useFirebase: null == useFirebase ? _self.useFirebase : useFirebase // ignore: cast_nullable_to_non_nullable
as bool,useEmulators: null == useEmulators ? _self.useEmulators : useEmulators // ignore: cast_nullable_to_non_nullable
as bool,inviteLinkHost: null == inviteLinkHost ? _self.inviteLinkHost : inviteLinkHost // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,supportEmail: null == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String,under13ProfilesEnabled: null == under13ProfilesEnabled ? _self.under13ProfilesEnabled : under13ProfilesEnabled // ignore: cast_nullable_to_non_nullable
as bool,googleServerClientId: null == googleServerClientId ? _self.googleServerClientId : googleServerClientId // ignore: cast_nullable_to_non_nullable
as String,appleServiceId: null == appleServiceId ? _self.appleServiceId : appleServiceId // ignore: cast_nullable_to_non_nullable
as String,appleRedirectUri: null == appleRedirectUri ? _self.appleRedirectUri : appleRedirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
