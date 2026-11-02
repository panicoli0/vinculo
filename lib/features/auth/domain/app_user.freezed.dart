// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUser {

/// Auth uid; it is the document id, not a stored field.
 String get uid;/// Adult, or minor created by a guardian.
 AccountType get accountType;/// Name shown to the family, 1 to 40 characters.
 String get displayName;/// Year of birth; immutable from the client.
 int get birthYear;/// Interface language choice, mirrored from the device preference.
 UiLocaleOption get uiLocale;/// How card text is shown.
 CardLanguageMode get cardLanguageMode;/// Language shown large in bilingual mode.
 CardLanguage get primaryLanguage;/// Creation instant; null while the server timestamp of a local write is
/// still pending.
 DateTime? get createdAt;/// Parental consent; only minors have one.
 MinorConsent? get consent;/// How the person joined the family; null for whoever created it.
 JoinedViaInfo? get joinedVia;/// When the person first answered a question.
 DateTime? get firstAnsweredAt;/// When the subscription fake door was first shown.
 DateTime? get fakeDoorSeenAt;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.cardLanguageMode, cardLanguageMode) || other.cardLanguageMode == cardLanguageMode)&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.joinedVia, joinedVia) || other.joinedVia == joinedVia)&&(identical(other.firstAnsweredAt, firstAnsweredAt) || other.firstAnsweredAt == firstAnsweredAt)&&(identical(other.fakeDoorSeenAt, fakeDoorSeenAt) || other.fakeDoorSeenAt == fakeDoorSeenAt));
}


@override
int get hashCode => Object.hash(runtimeType,uid,accountType,displayName,birthYear,uiLocale,cardLanguageMode,primaryLanguage,createdAt,consent,joinedVia,firstAnsweredAt,fakeDoorSeenAt);

@override
String toString() {
  return 'AppUser(uid: $uid, accountType: $accountType, displayName: $displayName, birthYear: $birthYear, uiLocale: $uiLocale, cardLanguageMode: $cardLanguageMode, primaryLanguage: $primaryLanguage, createdAt: $createdAt, consent: $consent, joinedVia: $joinedVia, firstAnsweredAt: $firstAnsweredAt, fakeDoorSeenAt: $fakeDoorSeenAt)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String uid, AccountType accountType, String displayName, int birthYear, UiLocaleOption uiLocale, CardLanguageMode cardLanguageMode, CardLanguage primaryLanguage, DateTime? createdAt, MinorConsent? consent, JoinedViaInfo? joinedVia, DateTime? firstAnsweredAt, DateTime? fakeDoorSeenAt
});


$MinorConsentCopyWith<$Res>? get consent;$JoinedViaInfoCopyWith<$Res>? get joinedVia;

}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? accountType = null,Object? displayName = null,Object? birthYear = null,Object? uiLocale = null,Object? cardLanguageMode = null,Object? primaryLanguage = null,Object? createdAt = freezed,Object? consent = freezed,Object? joinedVia = freezed,Object? firstAnsweredAt = freezed,Object? fakeDoorSeenAt = freezed,}) {
  return _then(AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int,uiLocale: null == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as UiLocaleOption,cardLanguageMode: null == cardLanguageMode ? _self.cardLanguageMode : cardLanguageMode // ignore: cast_nullable_to_non_nullable
as CardLanguageMode,primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as CardLanguage,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,consent: freezed == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as MinorConsent?,joinedVia: freezed == joinedVia ? _self.joinedVia : joinedVia // ignore: cast_nullable_to_non_nullable
as JoinedViaInfo?,firstAnsweredAt: freezed == firstAnsweredAt ? _self.firstAnsweredAt : firstAnsweredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fakeDoorSeenAt: freezed == fakeDoorSeenAt ? _self.fakeDoorSeenAt : fakeDoorSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinorConsentCopyWith<$Res>? get consent {
    if (_self.consent == null) {
    return null;
  }

  return $MinorConsentCopyWith<$Res>(_self.consent!, (value) {
    return _then(_self.copyWith(consent: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JoinedViaInfoCopyWith<$Res>? get joinedVia {
    if (_self.joinedVia == null) {
    return null;
  }

  return $JoinedViaInfoCopyWith<$Res>(_self.joinedVia!, (value) {
    return _then(_self.copyWith(joinedVia: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  AccountType accountType,  String displayName,  int birthYear,  UiLocaleOption uiLocale,  CardLanguageMode cardLanguageMode,  CardLanguage primaryLanguage,  DateTime? createdAt,  MinorConsent? consent,  JoinedViaInfo? joinedVia,  DateTime? firstAnsweredAt,  DateTime? fakeDoorSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.accountType,_that.displayName,_that.birthYear,_that.uiLocale,_that.cardLanguageMode,_that.primaryLanguage,_that.createdAt,_that.consent,_that.joinedVia,_that.firstAnsweredAt,_that.fakeDoorSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  AccountType accountType,  String displayName,  int birthYear,  UiLocaleOption uiLocale,  CardLanguageMode cardLanguageMode,  CardLanguage primaryLanguage,  DateTime? createdAt,  MinorConsent? consent,  JoinedViaInfo? joinedVia,  DateTime? firstAnsweredAt,  DateTime? fakeDoorSeenAt)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.uid,_that.accountType,_that.displayName,_that.birthYear,_that.uiLocale,_that.cardLanguageMode,_that.primaryLanguage,_that.createdAt,_that.consent,_that.joinedVia,_that.firstAnsweredAt,_that.fakeDoorSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  AccountType accountType,  String displayName,  int birthYear,  UiLocaleOption uiLocale,  CardLanguageMode cardLanguageMode,  CardLanguage primaryLanguage,  DateTime? createdAt,  MinorConsent? consent,  JoinedViaInfo? joinedVia,  DateTime? firstAnsweredAt,  DateTime? fakeDoorSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.accountType,_that.displayName,_that.birthYear,_that.uiLocale,_that.cardLanguageMode,_that.primaryLanguage,_that.createdAt,_that.consent,_that.joinedVia,_that.firstAnsweredAt,_that.fakeDoorSeenAt);case _:
  return null;

}
}

}

/// @nodoc


class _AppUser extends AppUser {
  const _AppUser({required this.uid, required this.accountType, required this.displayName, required this.birthYear, required this.uiLocale, required this.cardLanguageMode, required this.primaryLanguage, this.createdAt, this.consent, this.joinedVia, this.firstAnsweredAt, this.fakeDoorSeenAt}): super._();
  

/// Auth uid; it is the document id, not a stored field.
@override final  String uid;
/// Adult, or minor created by a guardian.
@override final  AccountType accountType;
/// Name shown to the family, 1 to 40 characters.
@override final  String displayName;
/// Year of birth; immutable from the client.
@override final  int birthYear;
/// Interface language choice, mirrored from the device preference.
@override final  UiLocaleOption uiLocale;
/// How card text is shown.
@override final  CardLanguageMode cardLanguageMode;
/// Language shown large in bilingual mode.
@override final  CardLanguage primaryLanguage;
/// Creation instant; null while the server timestamp of a local write is
/// still pending.
@override final  DateTime? createdAt;
/// Parental consent; only minors have one.
@override final  MinorConsent? consent;
/// How the person joined the family; null for whoever created it.
@override final  JoinedViaInfo? joinedVia;
/// When the person first answered a question.
@override final  DateTime? firstAnsweredAt;
/// When the subscription fake door was first shown.
@override final  DateTime? fakeDoorSeenAt;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.cardLanguageMode, cardLanguageMode) || other.cardLanguageMode == cardLanguageMode)&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.joinedVia, joinedVia) || other.joinedVia == joinedVia)&&(identical(other.firstAnsweredAt, firstAnsweredAt) || other.firstAnsweredAt == firstAnsweredAt)&&(identical(other.fakeDoorSeenAt, fakeDoorSeenAt) || other.fakeDoorSeenAt == fakeDoorSeenAt));
}


@override
int get hashCode => Object.hash(runtimeType,uid,accountType,displayName,birthYear,uiLocale,cardLanguageMode,primaryLanguage,createdAt,consent,joinedVia,firstAnsweredAt,fakeDoorSeenAt);

@override
String toString() {
  return 'AppUser(uid: $uid, accountType: $accountType, displayName: $displayName, birthYear: $birthYear, uiLocale: $uiLocale, cardLanguageMode: $cardLanguageMode, primaryLanguage: $primaryLanguage, createdAt: $createdAt, consent: $consent, joinedVia: $joinedVia, firstAnsweredAt: $firstAnsweredAt, fakeDoorSeenAt: $fakeDoorSeenAt)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, AccountType accountType, String displayName, int birthYear, UiLocaleOption uiLocale, CardLanguageMode cardLanguageMode, CardLanguage primaryLanguage, DateTime? createdAt, MinorConsent? consent, JoinedViaInfo? joinedVia, DateTime? firstAnsweredAt, DateTime? fakeDoorSeenAt
});


@override $MinorConsentCopyWith<$Res>? get consent;@override $JoinedViaInfoCopyWith<$Res>? get joinedVia;

}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? accountType = null,Object? displayName = null,Object? birthYear = null,Object? uiLocale = null,Object? cardLanguageMode = null,Object? primaryLanguage = null,Object? createdAt = freezed,Object? consent = freezed,Object? joinedVia = freezed,Object? firstAnsweredAt = freezed,Object? fakeDoorSeenAt = freezed,}) {
  return _then(_AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int,uiLocale: null == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as UiLocaleOption,cardLanguageMode: null == cardLanguageMode ? _self.cardLanguageMode : cardLanguageMode // ignore: cast_nullable_to_non_nullable
as CardLanguageMode,primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as CardLanguage,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,consent: freezed == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as MinorConsent?,joinedVia: freezed == joinedVia ? _self.joinedVia : joinedVia // ignore: cast_nullable_to_non_nullable
as JoinedViaInfo?,firstAnsweredAt: freezed == firstAnsweredAt ? _self.firstAnsweredAt : firstAnsweredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fakeDoorSeenAt: freezed == fakeDoorSeenAt ? _self.fakeDoorSeenAt : fakeDoorSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinorConsentCopyWith<$Res>? get consent {
    if (_self.consent == null) {
    return null;
  }

  return $MinorConsentCopyWith<$Res>(_self.consent!, (value) {
    return _then(_self.copyWith(consent: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JoinedViaInfoCopyWith<$Res>? get joinedVia {
    if (_self.joinedVia == null) {
    return null;
  }

  return $JoinedViaInfoCopyWith<$Res>(_self.joinedVia!, (value) {
    return _then(_self.copyWith(joinedVia: value));
  });
}
}

// dart format on
