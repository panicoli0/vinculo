// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthSession {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSession()';
}


}

/// @nodoc
class $AuthSessionCopyWith<$Res>  {
$AuthSessionCopyWith(AuthSession _, $Res Function(AuthSession) __);
}


/// Adds pattern-matching-related methods to [AuthSession].
extension AuthSessionPatterns on AuthSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignedOutSession value)?  signedOut,TResult Function( SignedInSession value)?  signedIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignedOutSession() when signedOut != null:
return signedOut(_that);case SignedInSession() when signedIn != null:
return signedIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignedOutSession value)  signedOut,required TResult Function( SignedInSession value)  signedIn,}){
final _that = this;
switch (_that) {
case SignedOutSession():
return signedOut(_that);case SignedInSession():
return signedIn(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignedOutSession value)?  signedOut,TResult? Function( SignedInSession value)?  signedIn,}){
final _that = this;
switch (_that) {
case SignedOutSession() when signedOut != null:
return signedOut(_that);case SignedInSession() when signedIn != null:
return signedIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signedOut,TResult Function( String uid)?  signedIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignedOutSession() when signedOut != null:
return signedOut();case SignedInSession() when signedIn != null:
return signedIn(_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signedOut,required TResult Function( String uid)  signedIn,}) {final _that = this;
switch (_that) {
case SignedOutSession():
return signedOut();case SignedInSession():
return signedIn(_that.uid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signedOut,TResult? Function( String uid)?  signedIn,}) {final _that = this;
switch (_that) {
case SignedOutSession() when signedOut != null:
return signedOut();case SignedInSession() when signedIn != null:
return signedIn(_that.uid);case _:
  return null;

}
}

}

/// @nodoc


class SignedOutSession implements AuthSession {
  const SignedOutSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedOutSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSession.signedOut()';
}


}




/// @nodoc


class SignedInSession implements AuthSession {
  const SignedInSession({required this.uid});
  

/// Firebase Auth uid of the signed-in account.
 final  String uid;

/// Create a copy of AuthSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedInSessionCopyWith<SignedInSession> get copyWith => _$SignedInSessionCopyWithImpl<SignedInSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedInSession&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'AuthSession.signedIn(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SignedInSessionCopyWith<$Res> implements $AuthSessionCopyWith<$Res> {
  factory $SignedInSessionCopyWith(SignedInSession value, $Res Function(SignedInSession) _then) = _$SignedInSessionCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SignedInSessionCopyWithImpl<$Res>
    implements $SignedInSessionCopyWith<$Res> {
  _$SignedInSessionCopyWithImpl(this._self, this._then);

  final SignedInSession _self;
  final $Res Function(SignedInSession) _then;

/// Create a copy of AuthSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SignedInSession(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
