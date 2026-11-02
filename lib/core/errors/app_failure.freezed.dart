// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppFailure {

 String get message; Object? get cause; StackTrace? get stackTrace;
/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFailureCopyWith<AppFailure> get copyWith => _$AppFailureCopyWithImpl<AppFailure>(this as AppFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppFailureCopyWith<$Res>  {
  factory $AppFailureCopyWith(AppFailure value, $Res Function(AppFailure) _then) = _$AppFailureCopyWithImpl;
@useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppFailureCopyWithImpl<$Res>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._self, this._then);

  final AppFailure _self;
  final $Res Function(AppFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppFailure].
extension AppFailurePatterns on AppFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthFailure value)?  auth,TResult Function( NetworkFailure value)?  network,TResult Function( PermissionDeniedFailure value)?  permissionDenied,TResult Function( NotFoundFailure value)?  notFound,TResult Function( InvalidCodeFailure value)?  invalidCode,TResult Function( QuotaExceededFailure value)?  quotaExceeded,TResult Function( ContentFailure value)?  content,TResult Function( StorageFailure value)?  storage,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that);case NetworkFailure() when network != null:
return network(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case InvalidCodeFailure() when invalidCode != null:
return invalidCode(_that);case QuotaExceededFailure() when quotaExceeded != null:
return quotaExceeded(_that);case ContentFailure() when content != null:
return content(_that);case StorageFailure() when storage != null:
return storage(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthFailure value)  auth,required TResult Function( NetworkFailure value)  network,required TResult Function( PermissionDeniedFailure value)  permissionDenied,required TResult Function( NotFoundFailure value)  notFound,required TResult Function( InvalidCodeFailure value)  invalidCode,required TResult Function( QuotaExceededFailure value)  quotaExceeded,required TResult Function( ContentFailure value)  content,required TResult Function( StorageFailure value)  storage,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case AuthFailure():
return auth(_that);case NetworkFailure():
return network(_that);case PermissionDeniedFailure():
return permissionDenied(_that);case NotFoundFailure():
return notFound(_that);case InvalidCodeFailure():
return invalidCode(_that);case QuotaExceededFailure():
return quotaExceeded(_that);case ContentFailure():
return content(_that);case StorageFailure():
return storage(_that);case UnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthFailure value)?  auth,TResult? Function( NetworkFailure value)?  network,TResult? Function( PermissionDeniedFailure value)?  permissionDenied,TResult? Function( NotFoundFailure value)?  notFound,TResult? Function( InvalidCodeFailure value)?  invalidCode,TResult? Function( QuotaExceededFailure value)?  quotaExceeded,TResult? Function( ContentFailure value)?  content,TResult? Function( StorageFailure value)?  storage,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that);case NetworkFailure() when network != null:
return network(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case InvalidCodeFailure() when invalidCode != null:
return invalidCode(_that);case QuotaExceededFailure() when quotaExceeded != null:
return quotaExceeded(_that);case ContentFailure() when content != null:
return content(_that);case StorageFailure() when storage != null:
return storage(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  auth,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  network,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  permissionDenied,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  invalidCode,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  quotaExceeded,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  content,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  storage,TResult Function( String message,  Object? cause,  StackTrace? stackTrace)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that.message,_that.cause,_that.stackTrace);case NetworkFailure() when network != null:
return network(_that.message,_that.cause,_that.stackTrace);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.cause,_that.stackTrace);case InvalidCodeFailure() when invalidCode != null:
return invalidCode(_that.message,_that.cause,_that.stackTrace);case QuotaExceededFailure() when quotaExceeded != null:
return quotaExceeded(_that.message,_that.cause,_that.stackTrace);case ContentFailure() when content != null:
return content(_that.message,_that.cause,_that.stackTrace);case StorageFailure() when storage != null:
return storage(_that.message,_that.cause,_that.stackTrace);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message,_that.cause,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  auth,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  network,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  permissionDenied,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  notFound,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  invalidCode,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  quotaExceeded,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  content,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  storage,required TResult Function( String message,  Object? cause,  StackTrace? stackTrace)  unexpected,}) {final _that = this;
switch (_that) {
case AuthFailure():
return auth(_that.message,_that.cause,_that.stackTrace);case NetworkFailure():
return network(_that.message,_that.cause,_that.stackTrace);case PermissionDeniedFailure():
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case NotFoundFailure():
return notFound(_that.message,_that.cause,_that.stackTrace);case InvalidCodeFailure():
return invalidCode(_that.message,_that.cause,_that.stackTrace);case QuotaExceededFailure():
return quotaExceeded(_that.message,_that.cause,_that.stackTrace);case ContentFailure():
return content(_that.message,_that.cause,_that.stackTrace);case StorageFailure():
return storage(_that.message,_that.cause,_that.stackTrace);case UnexpectedFailure():
return unexpected(_that.message,_that.cause,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  auth,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  network,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  permissionDenied,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  notFound,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  invalidCode,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  quotaExceeded,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  content,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  storage,TResult? Function( String message,  Object? cause,  StackTrace? stackTrace)?  unexpected,}) {final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that.message,_that.cause,_that.stackTrace);case NetworkFailure() when network != null:
return network(_that.message,_that.cause,_that.stackTrace);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that.message,_that.cause,_that.stackTrace);case NotFoundFailure() when notFound != null:
return notFound(_that.message,_that.cause,_that.stackTrace);case InvalidCodeFailure() when invalidCode != null:
return invalidCode(_that.message,_that.cause,_that.stackTrace);case QuotaExceededFailure() when quotaExceeded != null:
return quotaExceeded(_that.message,_that.cause,_that.stackTrace);case ContentFailure() when content != null:
return content(_that.message,_that.cause,_that.stackTrace);case StorageFailure() when storage != null:
return storage(_that.message,_that.cause,_that.stackTrace);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message,_that.cause,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class AuthFailure implements AppFailure {
  const AuthFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.auth(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(AuthFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class NetworkFailure implements AppFailure {
  const NetworkFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.network(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class PermissionDeniedFailure implements AppFailure {
  const PermissionDeniedFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionDeniedFailureCopyWith<PermissionDeniedFailure> get copyWith => _$PermissionDeniedFailureCopyWithImpl<PermissionDeniedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionDeniedFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.permissionDenied(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $PermissionDeniedFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $PermissionDeniedFailureCopyWith(PermissionDeniedFailure value, $Res Function(PermissionDeniedFailure) _then) = _$PermissionDeniedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$PermissionDeniedFailureCopyWithImpl<$Res>
    implements $PermissionDeniedFailureCopyWith<$Res> {
  _$PermissionDeniedFailureCopyWithImpl(this._self, this._then);

  final PermissionDeniedFailure _self;
  final $Res Function(PermissionDeniedFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(PermissionDeniedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class NotFoundFailure implements AppFailure {
  const NotFoundFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.notFound(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(NotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class InvalidCodeFailure implements AppFailure {
  const InvalidCodeFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCodeFailureCopyWith<InvalidCodeFailure> get copyWith => _$InvalidCodeFailureCopyWithImpl<InvalidCodeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidCodeFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.invalidCode(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $InvalidCodeFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $InvalidCodeFailureCopyWith(InvalidCodeFailure value, $Res Function(InvalidCodeFailure) _then) = _$InvalidCodeFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$InvalidCodeFailureCopyWithImpl<$Res>
    implements $InvalidCodeFailureCopyWith<$Res> {
  _$InvalidCodeFailureCopyWithImpl(this._self, this._then);

  final InvalidCodeFailure _self;
  final $Res Function(InvalidCodeFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(InvalidCodeFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class QuotaExceededFailure implements AppFailure {
  const QuotaExceededFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotaExceededFailureCopyWith<QuotaExceededFailure> get copyWith => _$QuotaExceededFailureCopyWithImpl<QuotaExceededFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotaExceededFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.quotaExceeded(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $QuotaExceededFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $QuotaExceededFailureCopyWith(QuotaExceededFailure value, $Res Function(QuotaExceededFailure) _then) = _$QuotaExceededFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$QuotaExceededFailureCopyWithImpl<$Res>
    implements $QuotaExceededFailureCopyWith<$Res> {
  _$QuotaExceededFailureCopyWithImpl(this._self, this._then);

  final QuotaExceededFailure _self;
  final $Res Function(QuotaExceededFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(QuotaExceededFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ContentFailure implements AppFailure {
  const ContentFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentFailureCopyWith<ContentFailure> get copyWith => _$ContentFailureCopyWithImpl<ContentFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.content(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ContentFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $ContentFailureCopyWith(ContentFailure value, $Res Function(ContentFailure) _then) = _$ContentFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$ContentFailureCopyWithImpl<$Res>
    implements $ContentFailureCopyWith<$Res> {
  _$ContentFailureCopyWithImpl(this._self, this._then);

  final ContentFailure _self;
  final $Res Function(ContentFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(ContentFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class StorageFailure implements AppFailure {
  const StorageFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageFailureCopyWith<StorageFailure> get copyWith => _$StorageFailureCopyWithImpl<StorageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.storage(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $StorageFailureCopyWith(StorageFailure value, $Res Function(StorageFailure) _then) = _$StorageFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(StorageFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements AppFailure {
  const UnexpectedFailure({required this.message, this.cause, this.stackTrace});
  

@override final  String message;
@override final  Object? cause;
@override final  StackTrace? stackTrace;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause),stackTrace);

@override
String toString() {
  return 'AppFailure.unexpected(message: $message, cause: $cause, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,Object? stackTrace = freezed,}) {
  return _then(UnexpectedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
