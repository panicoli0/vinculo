// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Family {

/// Firestore document id; no es un campo almacenado.
 String get id;/// Name the family chose, 1 to 40 characters.
 String get name;/// Uid of the adult who created it, and who pays once billing exists.
 String get ownerUid;/// Uids of every member, for `array-contains` queries.
///
/// Solo el cliente lo escribe al crear la familia, y únicamente con su
/// propio uid; después lo mantienen las Functions.
 List<String> get memberUids;/// Plan the family is on.
 FamilyPlan get plan;/// Pseudonymous random id used as `family_ref` in analytics.
///
/// Es lo único de la familia que puede salir del teléfono: nunca el id
/// del documento, que es una referencia real de Firestore.
 String get analyticsRef;/// Creation instant, or null while the server timestamp has not landed.
///
/// Un snapshot local posterior a `set()` todavía trae `null` acá; no se
/// resuelve con la hora del teléfono porque el día 28 del fake door se
/// cuenta desde la fecha del servidor.
 DateTime? get createdAt;
/// Create a copy of Family
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyCopyWith<Family> get copyWith => _$FamilyCopyWithImpl<Family>(this as Family, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Family&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ownerUid, ownerUid) || other.ownerUid == ownerUid)&&const DeepCollectionEquality().equals(other.memberUids, memberUids)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.analyticsRef, analyticsRef) || other.analyticsRef == analyticsRef)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,ownerUid,const DeepCollectionEquality().hash(memberUids),plan,analyticsRef,createdAt);

@override
String toString() {
  return 'Family(id: $id, name: $name, ownerUid: $ownerUid, memberUids: $memberUids, plan: $plan, analyticsRef: $analyticsRef, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FamilyCopyWith<$Res>  {
  factory $FamilyCopyWith(Family value, $Res Function(Family) _then) = _$FamilyCopyWithImpl;
@useResult
$Res call({
 String id, String name, String ownerUid, List<String> memberUids, FamilyPlan plan, String analyticsRef, DateTime? createdAt
});




}
/// @nodoc
class _$FamilyCopyWithImpl<$Res>
    implements $FamilyCopyWith<$Res> {
  _$FamilyCopyWithImpl(this._self, this._then);

  final Family _self;
  final $Res Function(Family) _then;

/// Create a copy of Family
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ownerUid = null,Object? memberUids = null,Object? plan = null,Object? analyticsRef = null,Object? createdAt = freezed,}) {
  return _then(Family(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ownerUid: null == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String,memberUids: null == memberUids ? _self.memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as FamilyPlan,analyticsRef: null == analyticsRef ? _self.analyticsRef : analyticsRef // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Family].
extension FamilyPatterns on Family {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Family value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Family() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Family value)  $default,){
final _that = this;
switch (_that) {
case _Family():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Family value)?  $default,){
final _that = this;
switch (_that) {
case _Family() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String ownerUid,  List<String> memberUids,  FamilyPlan plan,  String analyticsRef,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Family() when $default != null:
return $default(_that.id,_that.name,_that.ownerUid,_that.memberUids,_that.plan,_that.analyticsRef,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String ownerUid,  List<String> memberUids,  FamilyPlan plan,  String analyticsRef,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Family():
return $default(_that.id,_that.name,_that.ownerUid,_that.memberUids,_that.plan,_that.analyticsRef,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String ownerUid,  List<String> memberUids,  FamilyPlan plan,  String analyticsRef,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Family() when $default != null:
return $default(_that.id,_that.name,_that.ownerUid,_that.memberUids,_that.plan,_that.analyticsRef,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Family implements Family {
  const _Family({required this.id, required this.name, required this.ownerUid, required  List<String> memberUids, required this.plan, required this.analyticsRef, this.createdAt}): _memberUids = memberUids;
  

/// Firestore document id; no es un campo almacenado.
@override final  String id;
/// Name the family chose, 1 to 40 characters.
@override final  String name;
/// Uid of the adult who created it, and who pays once billing exists.
@override final  String ownerUid;
/// Uids of every member, for `array-contains` queries.
///
/// Solo el cliente lo escribe al crear la familia, y únicamente con su
/// propio uid; después lo mantienen las Functions.
 final  List<String> _memberUids;
/// Uids of every member, for `array-contains` queries.
///
/// Solo el cliente lo escribe al crear la familia, y únicamente con su
/// propio uid; después lo mantienen las Functions.
@override List<String> get memberUids {
  if (_memberUids is EqualUnmodifiableListView) return _memberUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberUids);
}

/// Plan the family is on.
@override final  FamilyPlan plan;
/// Pseudonymous random id used as `family_ref` in analytics.
///
/// Es lo único de la familia que puede salir del teléfono: nunca el id
/// del documento, que es una referencia real de Firestore.
@override final  String analyticsRef;
/// Creation instant, or null while the server timestamp has not landed.
///
/// Un snapshot local posterior a `set()` todavía trae `null` acá; no se
/// resuelve con la hora del teléfono porque el día 28 del fake door se
/// cuenta desde la fecha del servidor.
@override final  DateTime? createdAt;

/// Create a copy of Family
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyCopyWith<_Family> get copyWith => __$FamilyCopyWithImpl<_Family>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Family&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ownerUid, ownerUid) || other.ownerUid == ownerUid)&&const DeepCollectionEquality().equals(other._memberUids, _memberUids)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.analyticsRef, analyticsRef) || other.analyticsRef == analyticsRef)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,ownerUid,const DeepCollectionEquality().hash(_memberUids),plan,analyticsRef,createdAt);

@override
String toString() {
  return 'Family(id: $id, name: $name, ownerUid: $ownerUid, memberUids: $memberUids, plan: $plan, analyticsRef: $analyticsRef, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FamilyCopyWith<$Res> implements $FamilyCopyWith<$Res> {
  factory _$FamilyCopyWith(_Family value, $Res Function(_Family) _then) = __$FamilyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String ownerUid, List<String> memberUids, FamilyPlan plan, String analyticsRef, DateTime? createdAt
});




}
/// @nodoc
class __$FamilyCopyWithImpl<$Res>
    implements _$FamilyCopyWith<$Res> {
  __$FamilyCopyWithImpl(this._self, this._then);

  final _Family _self;
  final $Res Function(_Family) _then;

/// Create a copy of Family
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ownerUid = null,Object? memberUids = null,Object? plan = null,Object? analyticsRef = null,Object? createdAt = freezed,}) {
  return _then(_Family(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ownerUid: null == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String,memberUids: null == memberUids ? _self._memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as FamilyPlan,analyticsRef: null == analyticsRef ? _self.analyticsRef : analyticsRef // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
