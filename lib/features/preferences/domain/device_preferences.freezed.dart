// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DevicePreferences {

/// Interface language choice.
 UiLocaleOption get uiLocale;/// Light, dark or system theme.
 AppThemeMode get themeMode;/// Analytics consent; null means the question was never asked.
 bool? get analyticsConsent;/// Instant until which the age gate keeps this device locked out.
 DateTime? get ageGateLockedUntil;/// Invite code captured from a deep link before sign-in.
 String? get pendingInviteCode;
/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevicePreferencesCopyWith<DevicePreferences> get copyWith => _$DevicePreferencesCopyWithImpl<DevicePreferences>(this as DevicePreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevicePreferences&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.analyticsConsent, analyticsConsent) || other.analyticsConsent == analyticsConsent)&&(identical(other.ageGateLockedUntil, ageGateLockedUntil) || other.ageGateLockedUntil == ageGateLockedUntil)&&(identical(other.pendingInviteCode, pendingInviteCode) || other.pendingInviteCode == pendingInviteCode));
}


@override
int get hashCode => Object.hash(runtimeType,uiLocale,themeMode,analyticsConsent,ageGateLockedUntil,pendingInviteCode);

@override
String toString() {
  return 'DevicePreferences(uiLocale: $uiLocale, themeMode: $themeMode, analyticsConsent: $analyticsConsent, ageGateLockedUntil: $ageGateLockedUntil, pendingInviteCode: $pendingInviteCode)';
}


}

/// @nodoc
abstract mixin class $DevicePreferencesCopyWith<$Res>  {
  factory $DevicePreferencesCopyWith(DevicePreferences value, $Res Function(DevicePreferences) _then) = _$DevicePreferencesCopyWithImpl;
@useResult
$Res call({
 UiLocaleOption uiLocale, AppThemeMode themeMode, bool? analyticsConsent, DateTime? ageGateLockedUntil, String? pendingInviteCode
});




}
/// @nodoc
class _$DevicePreferencesCopyWithImpl<$Res>
    implements $DevicePreferencesCopyWith<$Res> {
  _$DevicePreferencesCopyWithImpl(this._self, this._then);

  final DevicePreferences _self;
  final $Res Function(DevicePreferences) _then;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uiLocale = null,Object? themeMode = null,Object? analyticsConsent = freezed,Object? ageGateLockedUntil = freezed,Object? pendingInviteCode = freezed,}) {
  return _then(DevicePreferences(
uiLocale: null == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as UiLocaleOption,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,analyticsConsent: freezed == analyticsConsent ? _self.analyticsConsent : analyticsConsent // ignore: cast_nullable_to_non_nullable
as bool?,ageGateLockedUntil: freezed == ageGateLockedUntil ? _self.ageGateLockedUntil : ageGateLockedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,pendingInviteCode: freezed == pendingInviteCode ? _self.pendingInviteCode : pendingInviteCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DevicePreferences].
extension DevicePreferencesPatterns on DevicePreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevicePreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevicePreferences value)  $default,){
final _that = this;
switch (_that) {
case _DevicePreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevicePreferences value)?  $default,){
final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UiLocaleOption uiLocale,  AppThemeMode themeMode,  bool? analyticsConsent,  DateTime? ageGateLockedUntil,  String? pendingInviteCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
return $default(_that.uiLocale,_that.themeMode,_that.analyticsConsent,_that.ageGateLockedUntil,_that.pendingInviteCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UiLocaleOption uiLocale,  AppThemeMode themeMode,  bool? analyticsConsent,  DateTime? ageGateLockedUntil,  String? pendingInviteCode)  $default,) {final _that = this;
switch (_that) {
case _DevicePreferences():
return $default(_that.uiLocale,_that.themeMode,_that.analyticsConsent,_that.ageGateLockedUntil,_that.pendingInviteCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UiLocaleOption uiLocale,  AppThemeMode themeMode,  bool? analyticsConsent,  DateTime? ageGateLockedUntil,  String? pendingInviteCode)?  $default,) {final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
return $default(_that.uiLocale,_that.themeMode,_that.analyticsConsent,_that.ageGateLockedUntil,_that.pendingInviteCode);case _:
  return null;

}
}

}

/// @nodoc


class _DevicePreferences implements DevicePreferences {
  const _DevicePreferences({this.uiLocale = UiLocaleOption.system, this.themeMode = AppThemeMode.system, this.analyticsConsent, this.ageGateLockedUntil, this.pendingInviteCode});
  

/// Interface language choice.
@override@JsonKey() final  UiLocaleOption uiLocale;
/// Light, dark or system theme.
@override@JsonKey() final  AppThemeMode themeMode;
/// Analytics consent; null means the question was never asked.
@override final  bool? analyticsConsent;
/// Instant until which the age gate keeps this device locked out.
@override final  DateTime? ageGateLockedUntil;
/// Invite code captured from a deep link before sign-in.
@override final  String? pendingInviteCode;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevicePreferencesCopyWith<_DevicePreferences> get copyWith => __$DevicePreferencesCopyWithImpl<_DevicePreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevicePreferences&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.analyticsConsent, analyticsConsent) || other.analyticsConsent == analyticsConsent)&&(identical(other.ageGateLockedUntil, ageGateLockedUntil) || other.ageGateLockedUntil == ageGateLockedUntil)&&(identical(other.pendingInviteCode, pendingInviteCode) || other.pendingInviteCode == pendingInviteCode));
}


@override
int get hashCode => Object.hash(runtimeType,uiLocale,themeMode,analyticsConsent,ageGateLockedUntil,pendingInviteCode);

@override
String toString() {
  return 'DevicePreferences(uiLocale: $uiLocale, themeMode: $themeMode, analyticsConsent: $analyticsConsent, ageGateLockedUntil: $ageGateLockedUntil, pendingInviteCode: $pendingInviteCode)';
}


}

/// @nodoc
abstract mixin class _$DevicePreferencesCopyWith<$Res> implements $DevicePreferencesCopyWith<$Res> {
  factory _$DevicePreferencesCopyWith(_DevicePreferences value, $Res Function(_DevicePreferences) _then) = __$DevicePreferencesCopyWithImpl;
@override @useResult
$Res call({
 UiLocaleOption uiLocale, AppThemeMode themeMode, bool? analyticsConsent, DateTime? ageGateLockedUntil, String? pendingInviteCode
});




}
/// @nodoc
class __$DevicePreferencesCopyWithImpl<$Res>
    implements _$DevicePreferencesCopyWith<$Res> {
  __$DevicePreferencesCopyWithImpl(this._self, this._then);

  final _DevicePreferences _self;
  final $Res Function(_DevicePreferences) _then;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uiLocale = null,Object? themeMode = null,Object? analyticsConsent = freezed,Object? ageGateLockedUntil = freezed,Object? pendingInviteCode = freezed,}) {
  return _then(_DevicePreferences(
uiLocale: null == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as UiLocaleOption,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,analyticsConsent: freezed == analyticsConsent ? _self.analyticsConsent : analyticsConsent // ignore: cast_nullable_to_non_nullable
as bool?,ageGateLockedUntil: freezed == ageGateLockedUntil ? _self.ageGateLockedUntil : ageGateLockedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,pendingInviteCode: freezed == pendingInviteCode ? _self.pendingInviteCode : pendingInviteCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
