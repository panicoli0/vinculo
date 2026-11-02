// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardText {

 String get en; String get es; String? get esUsted;
/// Create a copy of CardText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardTextCopyWith<CardText> get copyWith => _$CardTextCopyWithImpl<CardText>(this as CardText, _$identity);

  /// Serializes this CardText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardText&&(identical(other.en, en) || other.en == en)&&(identical(other.es, es) || other.es == es)&&(identical(other.esUsted, esUsted) || other.esUsted == esUsted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,es,esUsted);

@override
String toString() {
  return 'CardText(en: $en, es: $es, esUsted: $esUsted)';
}


}

/// @nodoc
abstract mixin class $CardTextCopyWith<$Res>  {
  factory $CardTextCopyWith(CardText value, $Res Function(CardText) _then) = _$CardTextCopyWithImpl;
@useResult
$Res call({
 String en, String es, String? esUsted
});




}
/// @nodoc
class _$CardTextCopyWithImpl<$Res>
    implements $CardTextCopyWith<$Res> {
  _$CardTextCopyWithImpl(this._self, this._then);

  final CardText _self;
  final $Res Function(CardText) _then;

/// Create a copy of CardText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,Object? es = null,Object? esUsted = freezed,}) {
  return _then(CardText(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,es: null == es ? _self.es : es // ignore: cast_nullable_to_non_nullable
as String,esUsted: freezed == esUsted ? _self.esUsted : esUsted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardText].
extension CardTextPatterns on CardText {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardText value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardText() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardText value)  $default,){
final _that = this;
switch (_that) {
case _CardText():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardText value)?  $default,){
final _that = this;
switch (_that) {
case _CardText() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String en,  String es,  String? esUsted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardText() when $default != null:
return $default(_that.en,_that.es,_that.esUsted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String en,  String es,  String? esUsted)  $default,) {final _that = this;
switch (_that) {
case _CardText():
return $default(_that.en,_that.es,_that.esUsted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String en,  String es,  String? esUsted)?  $default,) {final _that = this;
switch (_that) {
case _CardText() when $default != null:
return $default(_that.en,_that.es,_that.esUsted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardText extends CardText {
  const _CardText({required this.en, required this.es, this.esUsted}): super._();
  factory _CardText.fromJson(Map<String, dynamic> json) => _$CardTextFromJson(json);

@override final  String en;
@override final  String es;
@override final  String? esUsted;

/// Create a copy of CardText
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardTextCopyWith<_CardText> get copyWith => __$CardTextCopyWithImpl<_CardText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardText&&(identical(other.en, en) || other.en == en)&&(identical(other.es, es) || other.es == es)&&(identical(other.esUsted, esUsted) || other.esUsted == esUsted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,es,esUsted);

@override
String toString() {
  return 'CardText(en: $en, es: $es, esUsted: $esUsted)';
}


}

/// @nodoc
abstract mixin class _$CardTextCopyWith<$Res> implements $CardTextCopyWith<$Res> {
  factory _$CardTextCopyWith(_CardText value, $Res Function(_CardText) _then) = __$CardTextCopyWithImpl;
@override @useResult
$Res call({
 String en, String es, String? esUsted
});




}
/// @nodoc
class __$CardTextCopyWithImpl<$Res>
    implements _$CardTextCopyWith<$Res> {
  __$CardTextCopyWithImpl(this._self, this._then);

  final _CardText _self;
  final $Res Function(_CardText) _then;

/// Create a copy of CardText
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,Object? es = null,Object? esUsted = freezed,}) {
  return _then(_CardText(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,es: null == es ? _self.es : es // ignore: cast_nullable_to_non_nullable
as String,esUsted: freezed == esUsted ? _self.esUsted : esUsted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
