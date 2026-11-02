// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'minor_consent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MinorConsent {

/// Whether consent was required and granted.
 ConsentStatus get status;/// Uid of the guardian who gave the consent.
 String get guardianUid;/// How the guardian was verified.
 ParentalVerificationMethod get method;/// Version of the privacy notice the guardian saw.
 String get noticeVersion;/// Instant the consent was recorded.
 DateTime get at;
/// Create a copy of MinorConsent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinorConsentCopyWith<MinorConsent> get copyWith => _$MinorConsentCopyWithImpl<MinorConsent>(this as MinorConsent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinorConsent&&(identical(other.status, status) || other.status == status)&&(identical(other.guardianUid, guardianUid) || other.guardianUid == guardianUid)&&(identical(other.method, method) || other.method == method)&&(identical(other.noticeVersion, noticeVersion) || other.noticeVersion == noticeVersion)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,status,guardianUid,method,noticeVersion,at);

@override
String toString() {
  return 'MinorConsent(status: $status, guardianUid: $guardianUid, method: $method, noticeVersion: $noticeVersion, at: $at)';
}


}

/// @nodoc
abstract mixin class $MinorConsentCopyWith<$Res>  {
  factory $MinorConsentCopyWith(MinorConsent value, $Res Function(MinorConsent) _then) = _$MinorConsentCopyWithImpl;
@useResult
$Res call({
 ConsentStatus status, String guardianUid, ParentalVerificationMethod method, String noticeVersion, DateTime at
});




}
/// @nodoc
class _$MinorConsentCopyWithImpl<$Res>
    implements $MinorConsentCopyWith<$Res> {
  _$MinorConsentCopyWithImpl(this._self, this._then);

  final MinorConsent _self;
  final $Res Function(MinorConsent) _then;

/// Create a copy of MinorConsent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? guardianUid = null,Object? method = null,Object? noticeVersion = null,Object? at = null,}) {
  return _then(MinorConsent(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsentStatus,guardianUid: null == guardianUid ? _self.guardianUid : guardianUid // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ParentalVerificationMethod,noticeVersion: null == noticeVersion ? _self.noticeVersion : noticeVersion // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MinorConsent].
extension MinorConsentPatterns on MinorConsent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinorConsent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinorConsent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinorConsent value)  $default,){
final _that = this;
switch (_that) {
case _MinorConsent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinorConsent value)?  $default,){
final _that = this;
switch (_that) {
case _MinorConsent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsentStatus status,  String guardianUid,  ParentalVerificationMethod method,  String noticeVersion,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinorConsent() when $default != null:
return $default(_that.status,_that.guardianUid,_that.method,_that.noticeVersion,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsentStatus status,  String guardianUid,  ParentalVerificationMethod method,  String noticeVersion,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _MinorConsent():
return $default(_that.status,_that.guardianUid,_that.method,_that.noticeVersion,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsentStatus status,  String guardianUid,  ParentalVerificationMethod method,  String noticeVersion,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _MinorConsent() when $default != null:
return $default(_that.status,_that.guardianUid,_that.method,_that.noticeVersion,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _MinorConsent implements MinorConsent {
  const _MinorConsent({required this.status, required this.guardianUid, required this.method, required this.noticeVersion, required this.at});
  

/// Whether consent was required and granted.
@override final  ConsentStatus status;
/// Uid of the guardian who gave the consent.
@override final  String guardianUid;
/// How the guardian was verified.
@override final  ParentalVerificationMethod method;
/// Version of the privacy notice the guardian saw.
@override final  String noticeVersion;
/// Instant the consent was recorded.
@override final  DateTime at;

/// Create a copy of MinorConsent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinorConsentCopyWith<_MinorConsent> get copyWith => __$MinorConsentCopyWithImpl<_MinorConsent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinorConsent&&(identical(other.status, status) || other.status == status)&&(identical(other.guardianUid, guardianUid) || other.guardianUid == guardianUid)&&(identical(other.method, method) || other.method == method)&&(identical(other.noticeVersion, noticeVersion) || other.noticeVersion == noticeVersion)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,status,guardianUid,method,noticeVersion,at);

@override
String toString() {
  return 'MinorConsent(status: $status, guardianUid: $guardianUid, method: $method, noticeVersion: $noticeVersion, at: $at)';
}


}

/// @nodoc
abstract mixin class _$MinorConsentCopyWith<$Res> implements $MinorConsentCopyWith<$Res> {
  factory _$MinorConsentCopyWith(_MinorConsent value, $Res Function(_MinorConsent) _then) = __$MinorConsentCopyWithImpl;
@override @useResult
$Res call({
 ConsentStatus status, String guardianUid, ParentalVerificationMethod method, String noticeVersion, DateTime at
});




}
/// @nodoc
class __$MinorConsentCopyWithImpl<$Res>
    implements _$MinorConsentCopyWith<$Res> {
  __$MinorConsentCopyWithImpl(this._self, this._then);

  final _MinorConsent _self;
  final $Res Function(_MinorConsent) _then;

/// Create a copy of MinorConsent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? guardianUid = null,Object? method = null,Object? noticeVersion = null,Object? at = null,}) {
  return _then(_MinorConsent(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsentStatus,guardianUid: null == guardianUid ? _self.guardianUid : guardianUid // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ParentalVerificationMethod,noticeVersion: null == noticeVersion ? _self.noticeVersion : noticeVersion // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
