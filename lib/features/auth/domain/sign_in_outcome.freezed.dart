// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInOutcome {

/// Firebase Auth uid of the account that signed in.
 String get uid;/// Whether the Auth account was created by this sign-in.
 bool get isNewUser;/// Name the identity provider reported, or null when it reported none
/// (Apple only sends it the first time). Only prefills the age screen.
 String? get displayName;
/// Create a copy of SignInOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInOutcomeCopyWith<SignInOutcome> get copyWith => _$SignInOutcomeCopyWithImpl<SignInOutcome>(this as SignInOutcome, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInOutcome&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,uid,isNewUser,displayName);

@override
String toString() {
  return 'SignInOutcome(uid: $uid, isNewUser: $isNewUser, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $SignInOutcomeCopyWith<$Res>  {
  factory $SignInOutcomeCopyWith(SignInOutcome value, $Res Function(SignInOutcome) _then) = _$SignInOutcomeCopyWithImpl;
@useResult
$Res call({
 String uid, bool isNewUser, String? displayName
});




}
/// @nodoc
class _$SignInOutcomeCopyWithImpl<$Res>
    implements $SignInOutcomeCopyWith<$Res> {
  _$SignInOutcomeCopyWithImpl(this._self, this._then);

  final SignInOutcome _self;
  final $Res Function(SignInOutcome) _then;

/// Create a copy of SignInOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? isNewUser = null,Object? displayName = freezed,}) {
  return _then(SignInOutcome(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInOutcome].
extension SignInOutcomePatterns on SignInOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInOutcome value)  $default,){
final _that = this;
switch (_that) {
case _SignInOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _SignInOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  bool isNewUser,  String? displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInOutcome() when $default != null:
return $default(_that.uid,_that.isNewUser,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  bool isNewUser,  String? displayName)  $default,) {final _that = this;
switch (_that) {
case _SignInOutcome():
return $default(_that.uid,_that.isNewUser,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  bool isNewUser,  String? displayName)?  $default,) {final _that = this;
switch (_that) {
case _SignInOutcome() when $default != null:
return $default(_that.uid,_that.isNewUser,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc


class _SignInOutcome implements SignInOutcome {
  const _SignInOutcome({required this.uid, required this.isNewUser, this.displayName});
  

/// Firebase Auth uid of the account that signed in.
@override final  String uid;
/// Whether the Auth account was created by this sign-in.
@override final  bool isNewUser;
/// Name the identity provider reported, or null when it reported none
/// (Apple only sends it the first time). Only prefills the age screen.
@override final  String? displayName;

/// Create a copy of SignInOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInOutcomeCopyWith<_SignInOutcome> get copyWith => __$SignInOutcomeCopyWithImpl<_SignInOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInOutcome&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,uid,isNewUser,displayName);

@override
String toString() {
  return 'SignInOutcome(uid: $uid, isNewUser: $isNewUser, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$SignInOutcomeCopyWith<$Res> implements $SignInOutcomeCopyWith<$Res> {
  factory _$SignInOutcomeCopyWith(_SignInOutcome value, $Res Function(_SignInOutcome) _then) = __$SignInOutcomeCopyWithImpl;
@override @useResult
$Res call({
 String uid, bool isNewUser, String? displayName
});




}
/// @nodoc
class __$SignInOutcomeCopyWithImpl<$Res>
    implements _$SignInOutcomeCopyWith<$Res> {
  __$SignInOutcomeCopyWithImpl(this._self, this._then);

  final _SignInOutcome _self;
  final $Res Function(_SignInOutcome) _then;

/// Create a copy of SignInOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? isNewUser = null,Object? displayName = freezed,}) {
  return _then(_SignInOutcome(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
