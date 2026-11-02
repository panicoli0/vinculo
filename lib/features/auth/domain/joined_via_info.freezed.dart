// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'joined_via_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JoinedViaInfo {

/// Whether an adult invite or a minor code was used.
 JoinedVia get kind;/// Pseudonymous random id of the invite (`invites.analyticsRef`).
 String get inviteRef;/// Instant the invite was created.
 DateTime get inviteCreatedAt;/// Instant the invite was redeemed.
 DateTime get at;
/// Create a copy of JoinedViaInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinedViaInfoCopyWith<JoinedViaInfo> get copyWith => _$JoinedViaInfoCopyWithImpl<JoinedViaInfo>(this as JoinedViaInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinedViaInfo&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.inviteRef, inviteRef) || other.inviteRef == inviteRef)&&(identical(other.inviteCreatedAt, inviteCreatedAt) || other.inviteCreatedAt == inviteCreatedAt)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,kind,inviteRef,inviteCreatedAt,at);

@override
String toString() {
  return 'JoinedViaInfo(kind: $kind, inviteRef: $inviteRef, inviteCreatedAt: $inviteCreatedAt, at: $at)';
}


}

/// @nodoc
abstract mixin class $JoinedViaInfoCopyWith<$Res>  {
  factory $JoinedViaInfoCopyWith(JoinedViaInfo value, $Res Function(JoinedViaInfo) _then) = _$JoinedViaInfoCopyWithImpl;
@useResult
$Res call({
 JoinedVia kind, String inviteRef, DateTime inviteCreatedAt, DateTime at
});




}
/// @nodoc
class _$JoinedViaInfoCopyWithImpl<$Res>
    implements $JoinedViaInfoCopyWith<$Res> {
  _$JoinedViaInfoCopyWithImpl(this._self, this._then);

  final JoinedViaInfo _self;
  final $Res Function(JoinedViaInfo) _then;

/// Create a copy of JoinedViaInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? inviteRef = null,Object? inviteCreatedAt = null,Object? at = null,}) {
  return _then(JoinedViaInfo(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as JoinedVia,inviteRef: null == inviteRef ? _self.inviteRef : inviteRef // ignore: cast_nullable_to_non_nullable
as String,inviteCreatedAt: null == inviteCreatedAt ? _self.inviteCreatedAt : inviteCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [JoinedViaInfo].
extension JoinedViaInfoPatterns on JoinedViaInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JoinedViaInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinedViaInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JoinedViaInfo value)  $default,){
final _that = this;
switch (_that) {
case _JoinedViaInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JoinedViaInfo value)?  $default,){
final _that = this;
switch (_that) {
case _JoinedViaInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JoinedVia kind,  String inviteRef,  DateTime inviteCreatedAt,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinedViaInfo() when $default != null:
return $default(_that.kind,_that.inviteRef,_that.inviteCreatedAt,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JoinedVia kind,  String inviteRef,  DateTime inviteCreatedAt,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _JoinedViaInfo():
return $default(_that.kind,_that.inviteRef,_that.inviteCreatedAt,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JoinedVia kind,  String inviteRef,  DateTime inviteCreatedAt,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _JoinedViaInfo() when $default != null:
return $default(_that.kind,_that.inviteRef,_that.inviteCreatedAt,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _JoinedViaInfo implements JoinedViaInfo {
  const _JoinedViaInfo({required this.kind, required this.inviteRef, required this.inviteCreatedAt, required this.at});
  

/// Whether an adult invite or a minor code was used.
@override final  JoinedVia kind;
/// Pseudonymous random id of the invite (`invites.analyticsRef`).
@override final  String inviteRef;
/// Instant the invite was created.
@override final  DateTime inviteCreatedAt;
/// Instant the invite was redeemed.
@override final  DateTime at;

/// Create a copy of JoinedViaInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinedViaInfoCopyWith<_JoinedViaInfo> get copyWith => __$JoinedViaInfoCopyWithImpl<_JoinedViaInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinedViaInfo&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.inviteRef, inviteRef) || other.inviteRef == inviteRef)&&(identical(other.inviteCreatedAt, inviteCreatedAt) || other.inviteCreatedAt == inviteCreatedAt)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,kind,inviteRef,inviteCreatedAt,at);

@override
String toString() {
  return 'JoinedViaInfo(kind: $kind, inviteRef: $inviteRef, inviteCreatedAt: $inviteCreatedAt, at: $at)';
}


}

/// @nodoc
abstract mixin class _$JoinedViaInfoCopyWith<$Res> implements $JoinedViaInfoCopyWith<$Res> {
  factory _$JoinedViaInfoCopyWith(_JoinedViaInfo value, $Res Function(_JoinedViaInfo) _then) = __$JoinedViaInfoCopyWithImpl;
@override @useResult
$Res call({
 JoinedVia kind, String inviteRef, DateTime inviteCreatedAt, DateTime at
});




}
/// @nodoc
class __$JoinedViaInfoCopyWithImpl<$Res>
    implements _$JoinedViaInfoCopyWith<$Res> {
  __$JoinedViaInfoCopyWithImpl(this._self, this._then);

  final _JoinedViaInfo _self;
  final $Res Function(_JoinedViaInfo) _then;

/// Create a copy of JoinedViaInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? inviteRef = null,Object? inviteCreatedAt = null,Object? at = null,}) {
  return _then(_JoinedViaInfo(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as JoinedVia,inviteRef: null == inviteRef ? _self.inviteRef : inviteRef // ignore: cast_nullable_to_non_nullable
as String,inviteCreatedAt: null == inviteCreatedAt ? _self.inviteCreatedAt : inviteCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
