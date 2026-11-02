// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsEvent()';
}


}

/// @nodoc
class $AnalyticsEventCopyWith<$Res>  {
$AnalyticsEventCopyWith(AnalyticsEvent _, $Res Function(AnalyticsEvent) __);
}


/// Adds pattern-matching-related methods to [AnalyticsEvent].
extension AnalyticsEventPatterns on AnalyticsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInCompletedEvent value)?  signInCompleted,TResult Function( FamilyCreatedEvent value)?  familyCreated,TResult Function( InviteCreatedEvent value)?  inviteCreated,TResult Function( InviteAcceptedEvent value)?  inviteAccepted,TResult Function( MinorProfileCreatedEvent value)?  minorProfileCreated,TResult Function( BondCreatedEvent value)?  bondCreated,TResult Function( IntentChangedEvent value)?  intentChanged,TResult Function( QuestionSentEvent value)?  questionSent,TResult Function( CustomMatchSuggestedEvent value)?  customMatchSuggested,TResult Function( CustomMatchAcceptedEvent value)?  customMatchAccepted,TResult Function( QuestionOpenedEvent value)?  questionOpened,TResult Function( StoryToldEvent value)?  storyTold,TResult Function( FirstQuestionAnsweredEvent value)?  firstQuestionAnswered,TResult Function( AlreadyToldRemindedEvent value)?  alreadyToldReminded,TResult Function( AskDeclinedEvent value)?  askDeclined,TResult Function( ListenerNoteAddedEvent value)?  listenerNoteAdded,TResult Function( VariationsOpenedEvent value)?  variationsOpened,TResult Function( AiSuggestionsRequestedEvent value)?  aiSuggestionsRequested,TResult Function( MilestoneCelebratedEvent value)?  milestoneCelebrated,TResult Function( CheckpointViewedEvent value)?  checkpointViewed,TResult Function( RecommendedGoalTappedEvent value)?  recommendedGoalTapped,TResult Function( ReminderSetEvent value)?  reminderSet,TResult Function( ReminderOpenedEvent value)?  reminderOpened,TResult Function( PushOpenedEvent value)?  pushOpened,TResult Function( PaywallViewedEvent value)?  paywallViewed,TResult Function( SubscribeTappedEvent value)?  subscribeTapped,TResult Function( PaywallDismissedEvent value)?  paywallDismissed,TResult Function( SettingChangedEvent value)?  settingChanged,TResult Function( AccountDeletedEvent value)?  accountDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInCompletedEvent() when signInCompleted != null:
return signInCompleted(_that);case FamilyCreatedEvent() when familyCreated != null:
return familyCreated(_that);case InviteCreatedEvent() when inviteCreated != null:
return inviteCreated(_that);case InviteAcceptedEvent() when inviteAccepted != null:
return inviteAccepted(_that);case MinorProfileCreatedEvent() when minorProfileCreated != null:
return minorProfileCreated(_that);case BondCreatedEvent() when bondCreated != null:
return bondCreated(_that);case IntentChangedEvent() when intentChanged != null:
return intentChanged(_that);case QuestionSentEvent() when questionSent != null:
return questionSent(_that);case CustomMatchSuggestedEvent() when customMatchSuggested != null:
return customMatchSuggested(_that);case CustomMatchAcceptedEvent() when customMatchAccepted != null:
return customMatchAccepted(_that);case QuestionOpenedEvent() when questionOpened != null:
return questionOpened(_that);case StoryToldEvent() when storyTold != null:
return storyTold(_that);case FirstQuestionAnsweredEvent() when firstQuestionAnswered != null:
return firstQuestionAnswered(_that);case AlreadyToldRemindedEvent() when alreadyToldReminded != null:
return alreadyToldReminded(_that);case AskDeclinedEvent() when askDeclined != null:
return askDeclined(_that);case ListenerNoteAddedEvent() when listenerNoteAdded != null:
return listenerNoteAdded(_that);case VariationsOpenedEvent() when variationsOpened != null:
return variationsOpened(_that);case AiSuggestionsRequestedEvent() when aiSuggestionsRequested != null:
return aiSuggestionsRequested(_that);case MilestoneCelebratedEvent() when milestoneCelebrated != null:
return milestoneCelebrated(_that);case CheckpointViewedEvent() when checkpointViewed != null:
return checkpointViewed(_that);case RecommendedGoalTappedEvent() when recommendedGoalTapped != null:
return recommendedGoalTapped(_that);case ReminderSetEvent() when reminderSet != null:
return reminderSet(_that);case ReminderOpenedEvent() when reminderOpened != null:
return reminderOpened(_that);case PushOpenedEvent() when pushOpened != null:
return pushOpened(_that);case PaywallViewedEvent() when paywallViewed != null:
return paywallViewed(_that);case SubscribeTappedEvent() when subscribeTapped != null:
return subscribeTapped(_that);case PaywallDismissedEvent() when paywallDismissed != null:
return paywallDismissed(_that);case SettingChangedEvent() when settingChanged != null:
return settingChanged(_that);case AccountDeletedEvent() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInCompletedEvent value)  signInCompleted,required TResult Function( FamilyCreatedEvent value)  familyCreated,required TResult Function( InviteCreatedEvent value)  inviteCreated,required TResult Function( InviteAcceptedEvent value)  inviteAccepted,required TResult Function( MinorProfileCreatedEvent value)  minorProfileCreated,required TResult Function( BondCreatedEvent value)  bondCreated,required TResult Function( IntentChangedEvent value)  intentChanged,required TResult Function( QuestionSentEvent value)  questionSent,required TResult Function( CustomMatchSuggestedEvent value)  customMatchSuggested,required TResult Function( CustomMatchAcceptedEvent value)  customMatchAccepted,required TResult Function( QuestionOpenedEvent value)  questionOpened,required TResult Function( StoryToldEvent value)  storyTold,required TResult Function( FirstQuestionAnsweredEvent value)  firstQuestionAnswered,required TResult Function( AlreadyToldRemindedEvent value)  alreadyToldReminded,required TResult Function( AskDeclinedEvent value)  askDeclined,required TResult Function( ListenerNoteAddedEvent value)  listenerNoteAdded,required TResult Function( VariationsOpenedEvent value)  variationsOpened,required TResult Function( AiSuggestionsRequestedEvent value)  aiSuggestionsRequested,required TResult Function( MilestoneCelebratedEvent value)  milestoneCelebrated,required TResult Function( CheckpointViewedEvent value)  checkpointViewed,required TResult Function( RecommendedGoalTappedEvent value)  recommendedGoalTapped,required TResult Function( ReminderSetEvent value)  reminderSet,required TResult Function( ReminderOpenedEvent value)  reminderOpened,required TResult Function( PushOpenedEvent value)  pushOpened,required TResult Function( PaywallViewedEvent value)  paywallViewed,required TResult Function( SubscribeTappedEvent value)  subscribeTapped,required TResult Function( PaywallDismissedEvent value)  paywallDismissed,required TResult Function( SettingChangedEvent value)  settingChanged,required TResult Function( AccountDeletedEvent value)  accountDeleted,}){
final _that = this;
switch (_that) {
case SignInCompletedEvent():
return signInCompleted(_that);case FamilyCreatedEvent():
return familyCreated(_that);case InviteCreatedEvent():
return inviteCreated(_that);case InviteAcceptedEvent():
return inviteAccepted(_that);case MinorProfileCreatedEvent():
return minorProfileCreated(_that);case BondCreatedEvent():
return bondCreated(_that);case IntentChangedEvent():
return intentChanged(_that);case QuestionSentEvent():
return questionSent(_that);case CustomMatchSuggestedEvent():
return customMatchSuggested(_that);case CustomMatchAcceptedEvent():
return customMatchAccepted(_that);case QuestionOpenedEvent():
return questionOpened(_that);case StoryToldEvent():
return storyTold(_that);case FirstQuestionAnsweredEvent():
return firstQuestionAnswered(_that);case AlreadyToldRemindedEvent():
return alreadyToldReminded(_that);case AskDeclinedEvent():
return askDeclined(_that);case ListenerNoteAddedEvent():
return listenerNoteAdded(_that);case VariationsOpenedEvent():
return variationsOpened(_that);case AiSuggestionsRequestedEvent():
return aiSuggestionsRequested(_that);case MilestoneCelebratedEvent():
return milestoneCelebrated(_that);case CheckpointViewedEvent():
return checkpointViewed(_that);case RecommendedGoalTappedEvent():
return recommendedGoalTapped(_that);case ReminderSetEvent():
return reminderSet(_that);case ReminderOpenedEvent():
return reminderOpened(_that);case PushOpenedEvent():
return pushOpened(_that);case PaywallViewedEvent():
return paywallViewed(_that);case SubscribeTappedEvent():
return subscribeTapped(_that);case PaywallDismissedEvent():
return paywallDismissed(_that);case SettingChangedEvent():
return settingChanged(_that);case AccountDeletedEvent():
return accountDeleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInCompletedEvent value)?  signInCompleted,TResult? Function( FamilyCreatedEvent value)?  familyCreated,TResult? Function( InviteCreatedEvent value)?  inviteCreated,TResult? Function( InviteAcceptedEvent value)?  inviteAccepted,TResult? Function( MinorProfileCreatedEvent value)?  minorProfileCreated,TResult? Function( BondCreatedEvent value)?  bondCreated,TResult? Function( IntentChangedEvent value)?  intentChanged,TResult? Function( QuestionSentEvent value)?  questionSent,TResult? Function( CustomMatchSuggestedEvent value)?  customMatchSuggested,TResult? Function( CustomMatchAcceptedEvent value)?  customMatchAccepted,TResult? Function( QuestionOpenedEvent value)?  questionOpened,TResult? Function( StoryToldEvent value)?  storyTold,TResult? Function( FirstQuestionAnsweredEvent value)?  firstQuestionAnswered,TResult? Function( AlreadyToldRemindedEvent value)?  alreadyToldReminded,TResult? Function( AskDeclinedEvent value)?  askDeclined,TResult? Function( ListenerNoteAddedEvent value)?  listenerNoteAdded,TResult? Function( VariationsOpenedEvent value)?  variationsOpened,TResult? Function( AiSuggestionsRequestedEvent value)?  aiSuggestionsRequested,TResult? Function( MilestoneCelebratedEvent value)?  milestoneCelebrated,TResult? Function( CheckpointViewedEvent value)?  checkpointViewed,TResult? Function( RecommendedGoalTappedEvent value)?  recommendedGoalTapped,TResult? Function( ReminderSetEvent value)?  reminderSet,TResult? Function( ReminderOpenedEvent value)?  reminderOpened,TResult? Function( PushOpenedEvent value)?  pushOpened,TResult? Function( PaywallViewedEvent value)?  paywallViewed,TResult? Function( SubscribeTappedEvent value)?  subscribeTapped,TResult? Function( PaywallDismissedEvent value)?  paywallDismissed,TResult? Function( SettingChangedEvent value)?  settingChanged,TResult? Function( AccountDeletedEvent value)?  accountDeleted,}){
final _that = this;
switch (_that) {
case SignInCompletedEvent() when signInCompleted != null:
return signInCompleted(_that);case FamilyCreatedEvent() when familyCreated != null:
return familyCreated(_that);case InviteCreatedEvent() when inviteCreated != null:
return inviteCreated(_that);case InviteAcceptedEvent() when inviteAccepted != null:
return inviteAccepted(_that);case MinorProfileCreatedEvent() when minorProfileCreated != null:
return minorProfileCreated(_that);case BondCreatedEvent() when bondCreated != null:
return bondCreated(_that);case IntentChangedEvent() when intentChanged != null:
return intentChanged(_that);case QuestionSentEvent() when questionSent != null:
return questionSent(_that);case CustomMatchSuggestedEvent() when customMatchSuggested != null:
return customMatchSuggested(_that);case CustomMatchAcceptedEvent() when customMatchAccepted != null:
return customMatchAccepted(_that);case QuestionOpenedEvent() when questionOpened != null:
return questionOpened(_that);case StoryToldEvent() when storyTold != null:
return storyTold(_that);case FirstQuestionAnsweredEvent() when firstQuestionAnswered != null:
return firstQuestionAnswered(_that);case AlreadyToldRemindedEvent() when alreadyToldReminded != null:
return alreadyToldReminded(_that);case AskDeclinedEvent() when askDeclined != null:
return askDeclined(_that);case ListenerNoteAddedEvent() when listenerNoteAdded != null:
return listenerNoteAdded(_that);case VariationsOpenedEvent() when variationsOpened != null:
return variationsOpened(_that);case AiSuggestionsRequestedEvent() when aiSuggestionsRequested != null:
return aiSuggestionsRequested(_that);case MilestoneCelebratedEvent() when milestoneCelebrated != null:
return milestoneCelebrated(_that);case CheckpointViewedEvent() when checkpointViewed != null:
return checkpointViewed(_that);case RecommendedGoalTappedEvent() when recommendedGoalTapped != null:
return recommendedGoalTapped(_that);case ReminderSetEvent() when reminderSet != null:
return reminderSet(_that);case ReminderOpenedEvent() when reminderOpened != null:
return reminderOpened(_that);case PushOpenedEvent() when pushOpened != null:
return pushOpened(_that);case PaywallViewedEvent() when paywallViewed != null:
return paywallViewed(_that);case SubscribeTappedEvent() when subscribeTapped != null:
return subscribeTapped(_that);case PaywallDismissedEvent() when paywallDismissed != null:
return paywallDismissed(_that);case SettingChangedEvent() when settingChanged != null:
return settingChanged(_that);case AccountDeletedEvent() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignInMethod method,  bool isNewUser)?  signInCompleted,TResult Function( String familyRef)?  familyCreated,TResult Function( String familyRef,  InviteKind kind,  String inviteRef,  bool hasBondProposal,  bool hasFirstQuestion)?  inviteCreated,TResult Function( String familyRef,  InviteKind kind,  String inviteRef,  int hoursSinceInvite)?  inviteAccepted,TResult Function( String familyRef,  bool consentRequired)?  minorProfileCreated,TResult Function( String bondRef,  String familyRef,  RelationshipType relationship,  ConnectionIntent intent,  BondOrigin origin)?  bondCreated,TResult Function( String bondRef,  ConnectionIntent fromIntent,  ConnectionIntent toIntent)?  intentChanged,TResult Function( String bondRef,  QuestionSource source,  bool isVariation,  String cardId,  String topicId,  QuestionDirection direction,  bool alreadyToldToAsker)?  questionSent,TResult Function( String bondRef,  String cardId)?  customMatchSuggested,TResult Function( String bondRef,  String cardId)?  customMatchAccepted,TResult Function( String bondRef,  QuestionSource source,  int alreadyToldCount,  bool alreadyToldToAsker,  int hoursSinceSent)?  questionOpened,TResult Function( String bondRef,  TellingMode mode,  QuestionSource source,  bool fromAsk,  bool hasNote,  int alreadyToldCount,  int hoursSinceAsk)?  storyTold,TResult Function( JoinedVia joinedVia,  String inviteRef,  int hoursSinceInvite)?  firstQuestionAnswered,TResult Function( String bondRef)?  alreadyToldReminded,TResult Function( String bondRef,  QuestionSource source)?  askDeclined,TResult Function( String bondRef)?  listenerNoteAdded,TResult Function( String bondRef,  String cardId)?  variationsOpened,TResult Function( String bondRef,  AiSuggestionKind aiKind,  AiSuggestionOutcome result,  int count)?  aiSuggestionsRequested,TResult Function( String bondRef,  MilestoneId milestone)?  milestoneCelebrated,TResult Function( String bondRef,  int topicsCovered,  int topicsTotal)?  checkpointViewed,TResult Function( String bondRef,  String topicId)?  recommendedGoalTapped,TResult Function( String bondRef,  bool enabled,  int weekday)?  reminderSet,TResult Function( String bondRef)?  reminderOpened,TResult Function( PushKind pushKind)?  pushOpened,TResult Function( String familyRef,  int daysSinceFamilyCreated,  bool isOwner)?  paywallViewed,TResult Function( String familyRef,  SubscriptionPlan plan)?  subscribeTapped,TResult Function( String familyRef)?  paywallDismissed,TResult Function( SettingKey key,  String value)?  settingChanged,TResult Function( AccountDeletionType accountType)?  accountDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignInCompletedEvent() when signInCompleted != null:
return signInCompleted(_that.method,_that.isNewUser);case FamilyCreatedEvent() when familyCreated != null:
return familyCreated(_that.familyRef);case InviteCreatedEvent() when inviteCreated != null:
return inviteCreated(_that.familyRef,_that.kind,_that.inviteRef,_that.hasBondProposal,_that.hasFirstQuestion);case InviteAcceptedEvent() when inviteAccepted != null:
return inviteAccepted(_that.familyRef,_that.kind,_that.inviteRef,_that.hoursSinceInvite);case MinorProfileCreatedEvent() when minorProfileCreated != null:
return minorProfileCreated(_that.familyRef,_that.consentRequired);case BondCreatedEvent() when bondCreated != null:
return bondCreated(_that.bondRef,_that.familyRef,_that.relationship,_that.intent,_that.origin);case IntentChangedEvent() when intentChanged != null:
return intentChanged(_that.bondRef,_that.fromIntent,_that.toIntent);case QuestionSentEvent() when questionSent != null:
return questionSent(_that.bondRef,_that.source,_that.isVariation,_that.cardId,_that.topicId,_that.direction,_that.alreadyToldToAsker);case CustomMatchSuggestedEvent() when customMatchSuggested != null:
return customMatchSuggested(_that.bondRef,_that.cardId);case CustomMatchAcceptedEvent() when customMatchAccepted != null:
return customMatchAccepted(_that.bondRef,_that.cardId);case QuestionOpenedEvent() when questionOpened != null:
return questionOpened(_that.bondRef,_that.source,_that.alreadyToldCount,_that.alreadyToldToAsker,_that.hoursSinceSent);case StoryToldEvent() when storyTold != null:
return storyTold(_that.bondRef,_that.mode,_that.source,_that.fromAsk,_that.hasNote,_that.alreadyToldCount,_that.hoursSinceAsk);case FirstQuestionAnsweredEvent() when firstQuestionAnswered != null:
return firstQuestionAnswered(_that.joinedVia,_that.inviteRef,_that.hoursSinceInvite);case AlreadyToldRemindedEvent() when alreadyToldReminded != null:
return alreadyToldReminded(_that.bondRef);case AskDeclinedEvent() when askDeclined != null:
return askDeclined(_that.bondRef,_that.source);case ListenerNoteAddedEvent() when listenerNoteAdded != null:
return listenerNoteAdded(_that.bondRef);case VariationsOpenedEvent() when variationsOpened != null:
return variationsOpened(_that.bondRef,_that.cardId);case AiSuggestionsRequestedEvent() when aiSuggestionsRequested != null:
return aiSuggestionsRequested(_that.bondRef,_that.aiKind,_that.result,_that.count);case MilestoneCelebratedEvent() when milestoneCelebrated != null:
return milestoneCelebrated(_that.bondRef,_that.milestone);case CheckpointViewedEvent() when checkpointViewed != null:
return checkpointViewed(_that.bondRef,_that.topicsCovered,_that.topicsTotal);case RecommendedGoalTappedEvent() when recommendedGoalTapped != null:
return recommendedGoalTapped(_that.bondRef,_that.topicId);case ReminderSetEvent() when reminderSet != null:
return reminderSet(_that.bondRef,_that.enabled,_that.weekday);case ReminderOpenedEvent() when reminderOpened != null:
return reminderOpened(_that.bondRef);case PushOpenedEvent() when pushOpened != null:
return pushOpened(_that.pushKind);case PaywallViewedEvent() when paywallViewed != null:
return paywallViewed(_that.familyRef,_that.daysSinceFamilyCreated,_that.isOwner);case SubscribeTappedEvent() when subscribeTapped != null:
return subscribeTapped(_that.familyRef,_that.plan);case PaywallDismissedEvent() when paywallDismissed != null:
return paywallDismissed(_that.familyRef);case SettingChangedEvent() when settingChanged != null:
return settingChanged(_that.key,_that.value);case AccountDeletedEvent() when accountDeleted != null:
return accountDeleted(_that.accountType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignInMethod method,  bool isNewUser)  signInCompleted,required TResult Function( String familyRef)  familyCreated,required TResult Function( String familyRef,  InviteKind kind,  String inviteRef,  bool hasBondProposal,  bool hasFirstQuestion)  inviteCreated,required TResult Function( String familyRef,  InviteKind kind,  String inviteRef,  int hoursSinceInvite)  inviteAccepted,required TResult Function( String familyRef,  bool consentRequired)  minorProfileCreated,required TResult Function( String bondRef,  String familyRef,  RelationshipType relationship,  ConnectionIntent intent,  BondOrigin origin)  bondCreated,required TResult Function( String bondRef,  ConnectionIntent fromIntent,  ConnectionIntent toIntent)  intentChanged,required TResult Function( String bondRef,  QuestionSource source,  bool isVariation,  String cardId,  String topicId,  QuestionDirection direction,  bool alreadyToldToAsker)  questionSent,required TResult Function( String bondRef,  String cardId)  customMatchSuggested,required TResult Function( String bondRef,  String cardId)  customMatchAccepted,required TResult Function( String bondRef,  QuestionSource source,  int alreadyToldCount,  bool alreadyToldToAsker,  int hoursSinceSent)  questionOpened,required TResult Function( String bondRef,  TellingMode mode,  QuestionSource source,  bool fromAsk,  bool hasNote,  int alreadyToldCount,  int hoursSinceAsk)  storyTold,required TResult Function( JoinedVia joinedVia,  String inviteRef,  int hoursSinceInvite)  firstQuestionAnswered,required TResult Function( String bondRef)  alreadyToldReminded,required TResult Function( String bondRef,  QuestionSource source)  askDeclined,required TResult Function( String bondRef)  listenerNoteAdded,required TResult Function( String bondRef,  String cardId)  variationsOpened,required TResult Function( String bondRef,  AiSuggestionKind aiKind,  AiSuggestionOutcome result,  int count)  aiSuggestionsRequested,required TResult Function( String bondRef,  MilestoneId milestone)  milestoneCelebrated,required TResult Function( String bondRef,  int topicsCovered,  int topicsTotal)  checkpointViewed,required TResult Function( String bondRef,  String topicId)  recommendedGoalTapped,required TResult Function( String bondRef,  bool enabled,  int weekday)  reminderSet,required TResult Function( String bondRef)  reminderOpened,required TResult Function( PushKind pushKind)  pushOpened,required TResult Function( String familyRef,  int daysSinceFamilyCreated,  bool isOwner)  paywallViewed,required TResult Function( String familyRef,  SubscriptionPlan plan)  subscribeTapped,required TResult Function( String familyRef)  paywallDismissed,required TResult Function( SettingKey key,  String value)  settingChanged,required TResult Function( AccountDeletionType accountType)  accountDeleted,}) {final _that = this;
switch (_that) {
case SignInCompletedEvent():
return signInCompleted(_that.method,_that.isNewUser);case FamilyCreatedEvent():
return familyCreated(_that.familyRef);case InviteCreatedEvent():
return inviteCreated(_that.familyRef,_that.kind,_that.inviteRef,_that.hasBondProposal,_that.hasFirstQuestion);case InviteAcceptedEvent():
return inviteAccepted(_that.familyRef,_that.kind,_that.inviteRef,_that.hoursSinceInvite);case MinorProfileCreatedEvent():
return minorProfileCreated(_that.familyRef,_that.consentRequired);case BondCreatedEvent():
return bondCreated(_that.bondRef,_that.familyRef,_that.relationship,_that.intent,_that.origin);case IntentChangedEvent():
return intentChanged(_that.bondRef,_that.fromIntent,_that.toIntent);case QuestionSentEvent():
return questionSent(_that.bondRef,_that.source,_that.isVariation,_that.cardId,_that.topicId,_that.direction,_that.alreadyToldToAsker);case CustomMatchSuggestedEvent():
return customMatchSuggested(_that.bondRef,_that.cardId);case CustomMatchAcceptedEvent():
return customMatchAccepted(_that.bondRef,_that.cardId);case QuestionOpenedEvent():
return questionOpened(_that.bondRef,_that.source,_that.alreadyToldCount,_that.alreadyToldToAsker,_that.hoursSinceSent);case StoryToldEvent():
return storyTold(_that.bondRef,_that.mode,_that.source,_that.fromAsk,_that.hasNote,_that.alreadyToldCount,_that.hoursSinceAsk);case FirstQuestionAnsweredEvent():
return firstQuestionAnswered(_that.joinedVia,_that.inviteRef,_that.hoursSinceInvite);case AlreadyToldRemindedEvent():
return alreadyToldReminded(_that.bondRef);case AskDeclinedEvent():
return askDeclined(_that.bondRef,_that.source);case ListenerNoteAddedEvent():
return listenerNoteAdded(_that.bondRef);case VariationsOpenedEvent():
return variationsOpened(_that.bondRef,_that.cardId);case AiSuggestionsRequestedEvent():
return aiSuggestionsRequested(_that.bondRef,_that.aiKind,_that.result,_that.count);case MilestoneCelebratedEvent():
return milestoneCelebrated(_that.bondRef,_that.milestone);case CheckpointViewedEvent():
return checkpointViewed(_that.bondRef,_that.topicsCovered,_that.topicsTotal);case RecommendedGoalTappedEvent():
return recommendedGoalTapped(_that.bondRef,_that.topicId);case ReminderSetEvent():
return reminderSet(_that.bondRef,_that.enabled,_that.weekday);case ReminderOpenedEvent():
return reminderOpened(_that.bondRef);case PushOpenedEvent():
return pushOpened(_that.pushKind);case PaywallViewedEvent():
return paywallViewed(_that.familyRef,_that.daysSinceFamilyCreated,_that.isOwner);case SubscribeTappedEvent():
return subscribeTapped(_that.familyRef,_that.plan);case PaywallDismissedEvent():
return paywallDismissed(_that.familyRef);case SettingChangedEvent():
return settingChanged(_that.key,_that.value);case AccountDeletedEvent():
return accountDeleted(_that.accountType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignInMethod method,  bool isNewUser)?  signInCompleted,TResult? Function( String familyRef)?  familyCreated,TResult? Function( String familyRef,  InviteKind kind,  String inviteRef,  bool hasBondProposal,  bool hasFirstQuestion)?  inviteCreated,TResult? Function( String familyRef,  InviteKind kind,  String inviteRef,  int hoursSinceInvite)?  inviteAccepted,TResult? Function( String familyRef,  bool consentRequired)?  minorProfileCreated,TResult? Function( String bondRef,  String familyRef,  RelationshipType relationship,  ConnectionIntent intent,  BondOrigin origin)?  bondCreated,TResult? Function( String bondRef,  ConnectionIntent fromIntent,  ConnectionIntent toIntent)?  intentChanged,TResult? Function( String bondRef,  QuestionSource source,  bool isVariation,  String cardId,  String topicId,  QuestionDirection direction,  bool alreadyToldToAsker)?  questionSent,TResult? Function( String bondRef,  String cardId)?  customMatchSuggested,TResult? Function( String bondRef,  String cardId)?  customMatchAccepted,TResult? Function( String bondRef,  QuestionSource source,  int alreadyToldCount,  bool alreadyToldToAsker,  int hoursSinceSent)?  questionOpened,TResult? Function( String bondRef,  TellingMode mode,  QuestionSource source,  bool fromAsk,  bool hasNote,  int alreadyToldCount,  int hoursSinceAsk)?  storyTold,TResult? Function( JoinedVia joinedVia,  String inviteRef,  int hoursSinceInvite)?  firstQuestionAnswered,TResult? Function( String bondRef)?  alreadyToldReminded,TResult? Function( String bondRef,  QuestionSource source)?  askDeclined,TResult? Function( String bondRef)?  listenerNoteAdded,TResult? Function( String bondRef,  String cardId)?  variationsOpened,TResult? Function( String bondRef,  AiSuggestionKind aiKind,  AiSuggestionOutcome result,  int count)?  aiSuggestionsRequested,TResult? Function( String bondRef,  MilestoneId milestone)?  milestoneCelebrated,TResult? Function( String bondRef,  int topicsCovered,  int topicsTotal)?  checkpointViewed,TResult? Function( String bondRef,  String topicId)?  recommendedGoalTapped,TResult? Function( String bondRef,  bool enabled,  int weekday)?  reminderSet,TResult? Function( String bondRef)?  reminderOpened,TResult? Function( PushKind pushKind)?  pushOpened,TResult? Function( String familyRef,  int daysSinceFamilyCreated,  bool isOwner)?  paywallViewed,TResult? Function( String familyRef,  SubscriptionPlan plan)?  subscribeTapped,TResult? Function( String familyRef)?  paywallDismissed,TResult? Function( SettingKey key,  String value)?  settingChanged,TResult? Function( AccountDeletionType accountType)?  accountDeleted,}) {final _that = this;
switch (_that) {
case SignInCompletedEvent() when signInCompleted != null:
return signInCompleted(_that.method,_that.isNewUser);case FamilyCreatedEvent() when familyCreated != null:
return familyCreated(_that.familyRef);case InviteCreatedEvent() when inviteCreated != null:
return inviteCreated(_that.familyRef,_that.kind,_that.inviteRef,_that.hasBondProposal,_that.hasFirstQuestion);case InviteAcceptedEvent() when inviteAccepted != null:
return inviteAccepted(_that.familyRef,_that.kind,_that.inviteRef,_that.hoursSinceInvite);case MinorProfileCreatedEvent() when minorProfileCreated != null:
return minorProfileCreated(_that.familyRef,_that.consentRequired);case BondCreatedEvent() when bondCreated != null:
return bondCreated(_that.bondRef,_that.familyRef,_that.relationship,_that.intent,_that.origin);case IntentChangedEvent() when intentChanged != null:
return intentChanged(_that.bondRef,_that.fromIntent,_that.toIntent);case QuestionSentEvent() when questionSent != null:
return questionSent(_that.bondRef,_that.source,_that.isVariation,_that.cardId,_that.topicId,_that.direction,_that.alreadyToldToAsker);case CustomMatchSuggestedEvent() when customMatchSuggested != null:
return customMatchSuggested(_that.bondRef,_that.cardId);case CustomMatchAcceptedEvent() when customMatchAccepted != null:
return customMatchAccepted(_that.bondRef,_that.cardId);case QuestionOpenedEvent() when questionOpened != null:
return questionOpened(_that.bondRef,_that.source,_that.alreadyToldCount,_that.alreadyToldToAsker,_that.hoursSinceSent);case StoryToldEvent() when storyTold != null:
return storyTold(_that.bondRef,_that.mode,_that.source,_that.fromAsk,_that.hasNote,_that.alreadyToldCount,_that.hoursSinceAsk);case FirstQuestionAnsweredEvent() when firstQuestionAnswered != null:
return firstQuestionAnswered(_that.joinedVia,_that.inviteRef,_that.hoursSinceInvite);case AlreadyToldRemindedEvent() when alreadyToldReminded != null:
return alreadyToldReminded(_that.bondRef);case AskDeclinedEvent() when askDeclined != null:
return askDeclined(_that.bondRef,_that.source);case ListenerNoteAddedEvent() when listenerNoteAdded != null:
return listenerNoteAdded(_that.bondRef);case VariationsOpenedEvent() when variationsOpened != null:
return variationsOpened(_that.bondRef,_that.cardId);case AiSuggestionsRequestedEvent() when aiSuggestionsRequested != null:
return aiSuggestionsRequested(_that.bondRef,_that.aiKind,_that.result,_that.count);case MilestoneCelebratedEvent() when milestoneCelebrated != null:
return milestoneCelebrated(_that.bondRef,_that.milestone);case CheckpointViewedEvent() when checkpointViewed != null:
return checkpointViewed(_that.bondRef,_that.topicsCovered,_that.topicsTotal);case RecommendedGoalTappedEvent() when recommendedGoalTapped != null:
return recommendedGoalTapped(_that.bondRef,_that.topicId);case ReminderSetEvent() when reminderSet != null:
return reminderSet(_that.bondRef,_that.enabled,_that.weekday);case ReminderOpenedEvent() when reminderOpened != null:
return reminderOpened(_that.bondRef);case PushOpenedEvent() when pushOpened != null:
return pushOpened(_that.pushKind);case PaywallViewedEvent() when paywallViewed != null:
return paywallViewed(_that.familyRef,_that.daysSinceFamilyCreated,_that.isOwner);case SubscribeTappedEvent() when subscribeTapped != null:
return subscribeTapped(_that.familyRef,_that.plan);case PaywallDismissedEvent() when paywallDismissed != null:
return paywallDismissed(_that.familyRef);case SettingChangedEvent() when settingChanged != null:
return settingChanged(_that.key,_that.value);case AccountDeletedEvent() when accountDeleted != null:
return accountDeleted(_that.accountType);case _:
  return null;

}
}

}

/// @nodoc


class SignInCompletedEvent extends AnalyticsEvent {
  const SignInCompletedEvent({required this.method, required this.isNewUser}): super._();
  

/// Method used to sign in.
 final  SignInMethod method;
/// Whether the account was just created.
 final  bool isNewUser;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInCompletedEventCopyWith<SignInCompletedEvent> get copyWith => _$SignInCompletedEventCopyWithImpl<SignInCompletedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInCompletedEvent&&(identical(other.method, method) || other.method == method)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser));
}


@override
int get hashCode => Object.hash(runtimeType,method,isNewUser);

@override
String toString() {
  return 'AnalyticsEvent.signInCompleted(method: $method, isNewUser: $isNewUser)';
}


}

/// @nodoc
abstract mixin class $SignInCompletedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $SignInCompletedEventCopyWith(SignInCompletedEvent value, $Res Function(SignInCompletedEvent) _then) = _$SignInCompletedEventCopyWithImpl;
@useResult
$Res call({
 SignInMethod method, bool isNewUser
});




}
/// @nodoc
class _$SignInCompletedEventCopyWithImpl<$Res>
    implements $SignInCompletedEventCopyWith<$Res> {
  _$SignInCompletedEventCopyWithImpl(this._self, this._then);

  final SignInCompletedEvent _self;
  final $Res Function(SignInCompletedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,Object? isNewUser = null,}) {
  return _then(SignInCompletedEvent(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SignInMethod,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FamilyCreatedEvent extends AnalyticsEvent {
  const FamilyCreatedEvent({required this.familyRef}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyCreatedEventCopyWith<FamilyCreatedEvent> get copyWith => _$FamilyCreatedEventCopyWithImpl<FamilyCreatedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyCreatedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef);

@override
String toString() {
  return 'AnalyticsEvent.familyCreated(familyRef: $familyRef)';
}


}

/// @nodoc
abstract mixin class $FamilyCreatedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $FamilyCreatedEventCopyWith(FamilyCreatedEvent value, $Res Function(FamilyCreatedEvent) _then) = _$FamilyCreatedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef
});




}
/// @nodoc
class _$FamilyCreatedEventCopyWithImpl<$Res>
    implements $FamilyCreatedEventCopyWith<$Res> {
  _$FamilyCreatedEventCopyWithImpl(this._self, this._then);

  final FamilyCreatedEvent _self;
  final $Res Function(FamilyCreatedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,}) {
  return _then(FamilyCreatedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InviteCreatedEvent extends AnalyticsEvent {
  const InviteCreatedEvent({required this.familyRef, required this.kind, required this.inviteRef, required this.hasBondProposal, required this.hasFirstQuestion}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Whether the invite is for an adult or a minor.
 final  InviteKind kind;
/// Pseudonymous random id of the invite (`invites.analyticsRef`).
 final  String inviteRef;
/// Whether the invite carries a bond proposal.
 final  bool hasBondProposal;
/// Whether the invite carries a first question.
 final  bool hasFirstQuestion;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCreatedEventCopyWith<InviteCreatedEvent> get copyWith => _$InviteCreatedEventCopyWithImpl<InviteCreatedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCreatedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.inviteRef, inviteRef) || other.inviteRef == inviteRef)&&(identical(other.hasBondProposal, hasBondProposal) || other.hasBondProposal == hasBondProposal)&&(identical(other.hasFirstQuestion, hasFirstQuestion) || other.hasFirstQuestion == hasFirstQuestion));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef,kind,inviteRef,hasBondProposal,hasFirstQuestion);

@override
String toString() {
  return 'AnalyticsEvent.inviteCreated(familyRef: $familyRef, kind: $kind, inviteRef: $inviteRef, hasBondProposal: $hasBondProposal, hasFirstQuestion: $hasFirstQuestion)';
}


}

/// @nodoc
abstract mixin class $InviteCreatedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $InviteCreatedEventCopyWith(InviteCreatedEvent value, $Res Function(InviteCreatedEvent) _then) = _$InviteCreatedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef, InviteKind kind, String inviteRef, bool hasBondProposal, bool hasFirstQuestion
});




}
/// @nodoc
class _$InviteCreatedEventCopyWithImpl<$Res>
    implements $InviteCreatedEventCopyWith<$Res> {
  _$InviteCreatedEventCopyWithImpl(this._self, this._then);

  final InviteCreatedEvent _self;
  final $Res Function(InviteCreatedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,Object? kind = null,Object? inviteRef = null,Object? hasBondProposal = null,Object? hasFirstQuestion = null,}) {
  return _then(InviteCreatedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as InviteKind,inviteRef: null == inviteRef ? _self.inviteRef : inviteRef // ignore: cast_nullable_to_non_nullable
as String,hasBondProposal: null == hasBondProposal ? _self.hasBondProposal : hasBondProposal // ignore: cast_nullable_to_non_nullable
as bool,hasFirstQuestion: null == hasFirstQuestion ? _self.hasFirstQuestion : hasFirstQuestion // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class InviteAcceptedEvent extends AnalyticsEvent {
  const InviteAcceptedEvent({required this.familyRef, required this.kind, required this.inviteRef, required this.hoursSinceInvite}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Whether the invite was for an adult or a minor.
 final  InviteKind kind;
/// Pseudonymous random id of the invite (`invites.analyticsRef`).
 final  String inviteRef;
/// Hours elapsed since the invite was created.
 final  int hoursSinceInvite;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteAcceptedEventCopyWith<InviteAcceptedEvent> get copyWith => _$InviteAcceptedEventCopyWithImpl<InviteAcceptedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteAcceptedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.inviteRef, inviteRef) || other.inviteRef == inviteRef)&&(identical(other.hoursSinceInvite, hoursSinceInvite) || other.hoursSinceInvite == hoursSinceInvite));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef,kind,inviteRef,hoursSinceInvite);

@override
String toString() {
  return 'AnalyticsEvent.inviteAccepted(familyRef: $familyRef, kind: $kind, inviteRef: $inviteRef, hoursSinceInvite: $hoursSinceInvite)';
}


}

/// @nodoc
abstract mixin class $InviteAcceptedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $InviteAcceptedEventCopyWith(InviteAcceptedEvent value, $Res Function(InviteAcceptedEvent) _then) = _$InviteAcceptedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef, InviteKind kind, String inviteRef, int hoursSinceInvite
});




}
/// @nodoc
class _$InviteAcceptedEventCopyWithImpl<$Res>
    implements $InviteAcceptedEventCopyWith<$Res> {
  _$InviteAcceptedEventCopyWithImpl(this._self, this._then);

  final InviteAcceptedEvent _self;
  final $Res Function(InviteAcceptedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,Object? kind = null,Object? inviteRef = null,Object? hoursSinceInvite = null,}) {
  return _then(InviteAcceptedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as InviteKind,inviteRef: null == inviteRef ? _self.inviteRef : inviteRef // ignore: cast_nullable_to_non_nullable
as String,hoursSinceInvite: null == hoursSinceInvite ? _self.hoursSinceInvite : hoursSinceInvite // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MinorProfileCreatedEvent extends AnalyticsEvent {
  const MinorProfileCreatedEvent({required this.familyRef, required this.consentRequired}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Whether parental consent is required.
 final  bool consentRequired;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinorProfileCreatedEventCopyWith<MinorProfileCreatedEvent> get copyWith => _$MinorProfileCreatedEventCopyWithImpl<MinorProfileCreatedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinorProfileCreatedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.consentRequired, consentRequired) || other.consentRequired == consentRequired));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef,consentRequired);

@override
String toString() {
  return 'AnalyticsEvent.minorProfileCreated(familyRef: $familyRef, consentRequired: $consentRequired)';
}


}

/// @nodoc
abstract mixin class $MinorProfileCreatedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $MinorProfileCreatedEventCopyWith(MinorProfileCreatedEvent value, $Res Function(MinorProfileCreatedEvent) _then) = _$MinorProfileCreatedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef, bool consentRequired
});




}
/// @nodoc
class _$MinorProfileCreatedEventCopyWithImpl<$Res>
    implements $MinorProfileCreatedEventCopyWith<$Res> {
  _$MinorProfileCreatedEventCopyWithImpl(this._self, this._then);

  final MinorProfileCreatedEvent _self;
  final $Res Function(MinorProfileCreatedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,Object? consentRequired = null,}) {
  return _then(MinorProfileCreatedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,consentRequired: null == consentRequired ? _self.consentRequired : consentRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class BondCreatedEvent extends AnalyticsEvent {
  const BondCreatedEvent({required this.bondRef, required this.familyRef, required this.relationship, required this.intent, required this.origin}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Relationship type of the bond.
 final  RelationshipType relationship;
/// Intent chosen for the bond.
 final  ConnectionIntent intent;
/// Whether the bond was created manually or from an invite.
 final  BondOrigin origin;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BondCreatedEventCopyWith<BondCreatedEvent> get copyWith => _$BondCreatedEventCopyWithImpl<BondCreatedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BondCreatedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.origin, origin) || other.origin == origin));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,familyRef,relationship,intent,origin);

@override
String toString() {
  return 'AnalyticsEvent.bondCreated(bondRef: $bondRef, familyRef: $familyRef, relationship: $relationship, intent: $intent, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $BondCreatedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $BondCreatedEventCopyWith(BondCreatedEvent value, $Res Function(BondCreatedEvent) _then) = _$BondCreatedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, String familyRef, RelationshipType relationship, ConnectionIntent intent, BondOrigin origin
});




}
/// @nodoc
class _$BondCreatedEventCopyWithImpl<$Res>
    implements $BondCreatedEventCopyWith<$Res> {
  _$BondCreatedEventCopyWithImpl(this._self, this._then);

  final BondCreatedEvent _self;
  final $Res Function(BondCreatedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? familyRef = null,Object? relationship = null,Object? intent = null,Object? origin = null,}) {
  return _then(BondCreatedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as RelationshipType,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ConnectionIntent,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as BondOrigin,
  ));
}


}

/// @nodoc


class IntentChangedEvent extends AnalyticsEvent {
  const IntentChangedEvent({required this.bondRef, required this.fromIntent, required this.toIntent}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Intent before the change.
 final  ConnectionIntent fromIntent;
/// Intent after the change.
 final  ConnectionIntent toIntent;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntentChangedEventCopyWith<IntentChangedEvent> get copyWith => _$IntentChangedEventCopyWithImpl<IntentChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntentChangedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.fromIntent, fromIntent) || other.fromIntent == fromIntent)&&(identical(other.toIntent, toIntent) || other.toIntent == toIntent));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,fromIntent,toIntent);

@override
String toString() {
  return 'AnalyticsEvent.intentChanged(bondRef: $bondRef, fromIntent: $fromIntent, toIntent: $toIntent)';
}


}

/// @nodoc
abstract mixin class $IntentChangedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $IntentChangedEventCopyWith(IntentChangedEvent value, $Res Function(IntentChangedEvent) _then) = _$IntentChangedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, ConnectionIntent fromIntent, ConnectionIntent toIntent
});




}
/// @nodoc
class _$IntentChangedEventCopyWithImpl<$Res>
    implements $IntentChangedEventCopyWith<$Res> {
  _$IntentChangedEventCopyWithImpl(this._self, this._then);

  final IntentChangedEvent _self;
  final $Res Function(IntentChangedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? fromIntent = null,Object? toIntent = null,}) {
  return _then(IntentChangedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,fromIntent: null == fromIntent ? _self.fromIntent : fromIntent // ignore: cast_nullable_to_non_nullable
as ConnectionIntent,toIntent: null == toIntent ? _self.toIntent : toIntent // ignore: cast_nullable_to_non_nullable
as ConnectionIntent,
  ));
}


}

/// @nodoc


class QuestionSentEvent extends AnalyticsEvent {
  const QuestionSentEvent({required this.bondRef, required this.source, required this.isVariation, required this.cardId, required this.topicId, required this.direction, required this.alreadyToldToAsker}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Where the question came from.
 final  QuestionSource source;
/// Whether it is a variation of a curated card.
 final  bool isVariation;
/// Curated card id; `''` when not applicable (user-written or new AI question).
 final  String cardId;
/// Topic id; `''` when the question has no topic.
 final  String topicId;
/// Direction of the question within the bond.
 final  QuestionDirection direction;
/// Whether the teller already told this to the asker.
 final  bool alreadyToldToAsker;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionSentEventCopyWith<QuestionSentEvent> get copyWith => _$QuestionSentEventCopyWithImpl<QuestionSentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionSentEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.source, source) || other.source == source)&&(identical(other.isVariation, isVariation) || other.isVariation == isVariation)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.alreadyToldToAsker, alreadyToldToAsker) || other.alreadyToldToAsker == alreadyToldToAsker));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,source,isVariation,cardId,topicId,direction,alreadyToldToAsker);

@override
String toString() {
  return 'AnalyticsEvent.questionSent(bondRef: $bondRef, source: $source, isVariation: $isVariation, cardId: $cardId, topicId: $topicId, direction: $direction, alreadyToldToAsker: $alreadyToldToAsker)';
}


}

/// @nodoc
abstract mixin class $QuestionSentEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $QuestionSentEventCopyWith(QuestionSentEvent value, $Res Function(QuestionSentEvent) _then) = _$QuestionSentEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, QuestionSource source, bool isVariation, String cardId, String topicId, QuestionDirection direction, bool alreadyToldToAsker
});




}
/// @nodoc
class _$QuestionSentEventCopyWithImpl<$Res>
    implements $QuestionSentEventCopyWith<$Res> {
  _$QuestionSentEventCopyWithImpl(this._self, this._then);

  final QuestionSentEvent _self;
  final $Res Function(QuestionSentEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? source = null,Object? isVariation = null,Object? cardId = null,Object? topicId = null,Object? direction = null,Object? alreadyToldToAsker = null,}) {
  return _then(QuestionSentEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,isVariation: null == isVariation ? _self.isVariation : isVariation // ignore: cast_nullable_to_non_nullable
as bool,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as QuestionDirection,alreadyToldToAsker: null == alreadyToldToAsker ? _self.alreadyToldToAsker : alreadyToldToAsker // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CustomMatchSuggestedEvent extends AnalyticsEvent {
  const CustomMatchSuggestedEvent({required this.bondRef, required this.cardId}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Curated card id.
 final  String cardId;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomMatchSuggestedEventCopyWith<CustomMatchSuggestedEvent> get copyWith => _$CustomMatchSuggestedEventCopyWithImpl<CustomMatchSuggestedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomMatchSuggestedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.cardId, cardId) || other.cardId == cardId));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,cardId);

@override
String toString() {
  return 'AnalyticsEvent.customMatchSuggested(bondRef: $bondRef, cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class $CustomMatchSuggestedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $CustomMatchSuggestedEventCopyWith(CustomMatchSuggestedEvent value, $Res Function(CustomMatchSuggestedEvent) _then) = _$CustomMatchSuggestedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, String cardId
});




}
/// @nodoc
class _$CustomMatchSuggestedEventCopyWithImpl<$Res>
    implements $CustomMatchSuggestedEventCopyWith<$Res> {
  _$CustomMatchSuggestedEventCopyWithImpl(this._self, this._then);

  final CustomMatchSuggestedEvent _self;
  final $Res Function(CustomMatchSuggestedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? cardId = null,}) {
  return _then(CustomMatchSuggestedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CustomMatchAcceptedEvent extends AnalyticsEvent {
  const CustomMatchAcceptedEvent({required this.bondRef, required this.cardId}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Curated card id.
 final  String cardId;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomMatchAcceptedEventCopyWith<CustomMatchAcceptedEvent> get copyWith => _$CustomMatchAcceptedEventCopyWithImpl<CustomMatchAcceptedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomMatchAcceptedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.cardId, cardId) || other.cardId == cardId));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,cardId);

@override
String toString() {
  return 'AnalyticsEvent.customMatchAccepted(bondRef: $bondRef, cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class $CustomMatchAcceptedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $CustomMatchAcceptedEventCopyWith(CustomMatchAcceptedEvent value, $Res Function(CustomMatchAcceptedEvent) _then) = _$CustomMatchAcceptedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, String cardId
});




}
/// @nodoc
class _$CustomMatchAcceptedEventCopyWithImpl<$Res>
    implements $CustomMatchAcceptedEventCopyWith<$Res> {
  _$CustomMatchAcceptedEventCopyWithImpl(this._self, this._then);

  final CustomMatchAcceptedEvent _self;
  final $Res Function(CustomMatchAcceptedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? cardId = null,}) {
  return _then(CustomMatchAcceptedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuestionOpenedEvent extends AnalyticsEvent {
  const QuestionOpenedEvent({required this.bondRef, required this.source, required this.alreadyToldCount, required this.alreadyToldToAsker, required this.hoursSinceSent}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Where the question came from.
 final  QuestionSource source;
/// How many other listeners already heard it from the teller.
 final  int alreadyToldCount;
/// Whether the teller already told this to the asker.
 final  bool alreadyToldToAsker;
/// Hours elapsed since the question was sent.
 final  int hoursSinceSent;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionOpenedEventCopyWith<QuestionOpenedEvent> get copyWith => _$QuestionOpenedEventCopyWithImpl<QuestionOpenedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionOpenedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.source, source) || other.source == source)&&(identical(other.alreadyToldCount, alreadyToldCount) || other.alreadyToldCount == alreadyToldCount)&&(identical(other.alreadyToldToAsker, alreadyToldToAsker) || other.alreadyToldToAsker == alreadyToldToAsker)&&(identical(other.hoursSinceSent, hoursSinceSent) || other.hoursSinceSent == hoursSinceSent));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,source,alreadyToldCount,alreadyToldToAsker,hoursSinceSent);

@override
String toString() {
  return 'AnalyticsEvent.questionOpened(bondRef: $bondRef, source: $source, alreadyToldCount: $alreadyToldCount, alreadyToldToAsker: $alreadyToldToAsker, hoursSinceSent: $hoursSinceSent)';
}


}

/// @nodoc
abstract mixin class $QuestionOpenedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $QuestionOpenedEventCopyWith(QuestionOpenedEvent value, $Res Function(QuestionOpenedEvent) _then) = _$QuestionOpenedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, QuestionSource source, int alreadyToldCount, bool alreadyToldToAsker, int hoursSinceSent
});




}
/// @nodoc
class _$QuestionOpenedEventCopyWithImpl<$Res>
    implements $QuestionOpenedEventCopyWith<$Res> {
  _$QuestionOpenedEventCopyWithImpl(this._self, this._then);

  final QuestionOpenedEvent _self;
  final $Res Function(QuestionOpenedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? source = null,Object? alreadyToldCount = null,Object? alreadyToldToAsker = null,Object? hoursSinceSent = null,}) {
  return _then(QuestionOpenedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,alreadyToldCount: null == alreadyToldCount ? _self.alreadyToldCount : alreadyToldCount // ignore: cast_nullable_to_non_nullable
as int,alreadyToldToAsker: null == alreadyToldToAsker ? _self.alreadyToldToAsker : alreadyToldToAsker // ignore: cast_nullable_to_non_nullable
as bool,hoursSinceSent: null == hoursSinceSent ? _self.hoursSinceSent : hoursSinceSent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StoryToldEvent extends AnalyticsEvent {
  const StoryToldEvent({required this.bondRef, required this.mode, required this.source, required this.fromAsk, required this.hasNote, required this.alreadyToldCount, required this.hoursSinceAsk}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Written, or told offline.
 final  TellingMode mode;
/// Where the question came from.
 final  QuestionSource source;
/// Whether it answers a received question.
 final  bool fromAsk;
/// Whether the teller attached a note.
 final  bool hasNote;
/// How many other listeners already heard it from the teller.
 final  int alreadyToldCount;
/// Hours elapsed since the question; `-1` when there is no question.
 final  int hoursSinceAsk;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryToldEventCopyWith<StoryToldEvent> get copyWith => _$StoryToldEventCopyWithImpl<StoryToldEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryToldEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.source, source) || other.source == source)&&(identical(other.fromAsk, fromAsk) || other.fromAsk == fromAsk)&&(identical(other.hasNote, hasNote) || other.hasNote == hasNote)&&(identical(other.alreadyToldCount, alreadyToldCount) || other.alreadyToldCount == alreadyToldCount)&&(identical(other.hoursSinceAsk, hoursSinceAsk) || other.hoursSinceAsk == hoursSinceAsk));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,mode,source,fromAsk,hasNote,alreadyToldCount,hoursSinceAsk);

@override
String toString() {
  return 'AnalyticsEvent.storyTold(bondRef: $bondRef, mode: $mode, source: $source, fromAsk: $fromAsk, hasNote: $hasNote, alreadyToldCount: $alreadyToldCount, hoursSinceAsk: $hoursSinceAsk)';
}


}

/// @nodoc
abstract mixin class $StoryToldEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $StoryToldEventCopyWith(StoryToldEvent value, $Res Function(StoryToldEvent) _then) = _$StoryToldEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, TellingMode mode, QuestionSource source, bool fromAsk, bool hasNote, int alreadyToldCount, int hoursSinceAsk
});




}
/// @nodoc
class _$StoryToldEventCopyWithImpl<$Res>
    implements $StoryToldEventCopyWith<$Res> {
  _$StoryToldEventCopyWithImpl(this._self, this._then);

  final StoryToldEvent _self;
  final $Res Function(StoryToldEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? mode = null,Object? source = null,Object? fromAsk = null,Object? hasNote = null,Object? alreadyToldCount = null,Object? hoursSinceAsk = null,}) {
  return _then(StoryToldEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TellingMode,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,fromAsk: null == fromAsk ? _self.fromAsk : fromAsk // ignore: cast_nullable_to_non_nullable
as bool,hasNote: null == hasNote ? _self.hasNote : hasNote // ignore: cast_nullable_to_non_nullable
as bool,alreadyToldCount: null == alreadyToldCount ? _self.alreadyToldCount : alreadyToldCount // ignore: cast_nullable_to_non_nullable
as int,hoursSinceAsk: null == hoursSinceAsk ? _self.hoursSinceAsk : hoursSinceAsk // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FirstQuestionAnsweredEvent extends AnalyticsEvent {
  const FirstQuestionAnsweredEvent({required this.joinedVia, required this.inviteRef, required this.hoursSinceInvite}): super._();
  

/// How the person joined the family.
 final  JoinedVia joinedVia;
/// Pseudonymous random id of the invite; `''` for the owner.
 final  String inviteRef;
/// Hours elapsed since the invite was created; `-1` for the owner.
 final  int hoursSinceInvite;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirstQuestionAnsweredEventCopyWith<FirstQuestionAnsweredEvent> get copyWith => _$FirstQuestionAnsweredEventCopyWithImpl<FirstQuestionAnsweredEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstQuestionAnsweredEvent&&(identical(other.joinedVia, joinedVia) || other.joinedVia == joinedVia)&&(identical(other.inviteRef, inviteRef) || other.inviteRef == inviteRef)&&(identical(other.hoursSinceInvite, hoursSinceInvite) || other.hoursSinceInvite == hoursSinceInvite));
}


@override
int get hashCode => Object.hash(runtimeType,joinedVia,inviteRef,hoursSinceInvite);

@override
String toString() {
  return 'AnalyticsEvent.firstQuestionAnswered(joinedVia: $joinedVia, inviteRef: $inviteRef, hoursSinceInvite: $hoursSinceInvite)';
}


}

/// @nodoc
abstract mixin class $FirstQuestionAnsweredEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $FirstQuestionAnsweredEventCopyWith(FirstQuestionAnsweredEvent value, $Res Function(FirstQuestionAnsweredEvent) _then) = _$FirstQuestionAnsweredEventCopyWithImpl;
@useResult
$Res call({
 JoinedVia joinedVia, String inviteRef, int hoursSinceInvite
});




}
/// @nodoc
class _$FirstQuestionAnsweredEventCopyWithImpl<$Res>
    implements $FirstQuestionAnsweredEventCopyWith<$Res> {
  _$FirstQuestionAnsweredEventCopyWithImpl(this._self, this._then);

  final FirstQuestionAnsweredEvent _self;
  final $Res Function(FirstQuestionAnsweredEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? joinedVia = null,Object? inviteRef = null,Object? hoursSinceInvite = null,}) {
  return _then(FirstQuestionAnsweredEvent(
joinedVia: null == joinedVia ? _self.joinedVia : joinedVia // ignore: cast_nullable_to_non_nullable
as JoinedVia,inviteRef: null == inviteRef ? _self.inviteRef : inviteRef // ignore: cast_nullable_to_non_nullable
as String,hoursSinceInvite: null == hoursSinceInvite ? _self.hoursSinceInvite : hoursSinceInvite // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AlreadyToldRemindedEvent extends AnalyticsEvent {
  const AlreadyToldRemindedEvent({required this.bondRef}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlreadyToldRemindedEventCopyWith<AlreadyToldRemindedEvent> get copyWith => _$AlreadyToldRemindedEventCopyWithImpl<AlreadyToldRemindedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlreadyToldRemindedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef);

@override
String toString() {
  return 'AnalyticsEvent.alreadyToldReminded(bondRef: $bondRef)';
}


}

/// @nodoc
abstract mixin class $AlreadyToldRemindedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $AlreadyToldRemindedEventCopyWith(AlreadyToldRemindedEvent value, $Res Function(AlreadyToldRemindedEvent) _then) = _$AlreadyToldRemindedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef
});




}
/// @nodoc
class _$AlreadyToldRemindedEventCopyWithImpl<$Res>
    implements $AlreadyToldRemindedEventCopyWith<$Res> {
  _$AlreadyToldRemindedEventCopyWithImpl(this._self, this._then);

  final AlreadyToldRemindedEvent _self;
  final $Res Function(AlreadyToldRemindedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,}) {
  return _then(AlreadyToldRemindedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AskDeclinedEvent extends AnalyticsEvent {
  const AskDeclinedEvent({required this.bondRef, required this.source}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Where the question came from.
 final  QuestionSource source;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskDeclinedEventCopyWith<AskDeclinedEvent> get copyWith => _$AskDeclinedEventCopyWithImpl<AskDeclinedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskDeclinedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,source);

@override
String toString() {
  return 'AnalyticsEvent.askDeclined(bondRef: $bondRef, source: $source)';
}


}

/// @nodoc
abstract mixin class $AskDeclinedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $AskDeclinedEventCopyWith(AskDeclinedEvent value, $Res Function(AskDeclinedEvent) _then) = _$AskDeclinedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, QuestionSource source
});




}
/// @nodoc
class _$AskDeclinedEventCopyWithImpl<$Res>
    implements $AskDeclinedEventCopyWith<$Res> {
  _$AskDeclinedEventCopyWithImpl(this._self, this._then);

  final AskDeclinedEvent _self;
  final $Res Function(AskDeclinedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? source = null,}) {
  return _then(AskDeclinedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,
  ));
}


}

/// @nodoc


class ListenerNoteAddedEvent extends AnalyticsEvent {
  const ListenerNoteAddedEvent({required this.bondRef}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNoteAddedEventCopyWith<ListenerNoteAddedEvent> get copyWith => _$ListenerNoteAddedEventCopyWithImpl<ListenerNoteAddedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNoteAddedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef);

@override
String toString() {
  return 'AnalyticsEvent.listenerNoteAdded(bondRef: $bondRef)';
}


}

/// @nodoc
abstract mixin class $ListenerNoteAddedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $ListenerNoteAddedEventCopyWith(ListenerNoteAddedEvent value, $Res Function(ListenerNoteAddedEvent) _then) = _$ListenerNoteAddedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef
});




}
/// @nodoc
class _$ListenerNoteAddedEventCopyWithImpl<$Res>
    implements $ListenerNoteAddedEventCopyWith<$Res> {
  _$ListenerNoteAddedEventCopyWithImpl(this._self, this._then);

  final ListenerNoteAddedEvent _self;
  final $Res Function(ListenerNoteAddedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,}) {
  return _then(ListenerNoteAddedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VariationsOpenedEvent extends AnalyticsEvent {
  const VariationsOpenedEvent({required this.bondRef, required this.cardId}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Curated card id.
 final  String cardId;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariationsOpenedEventCopyWith<VariationsOpenedEvent> get copyWith => _$VariationsOpenedEventCopyWithImpl<VariationsOpenedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariationsOpenedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.cardId, cardId) || other.cardId == cardId));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,cardId);

@override
String toString() {
  return 'AnalyticsEvent.variationsOpened(bondRef: $bondRef, cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class $VariationsOpenedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $VariationsOpenedEventCopyWith(VariationsOpenedEvent value, $Res Function(VariationsOpenedEvent) _then) = _$VariationsOpenedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, String cardId
});




}
/// @nodoc
class _$VariationsOpenedEventCopyWithImpl<$Res>
    implements $VariationsOpenedEventCopyWith<$Res> {
  _$VariationsOpenedEventCopyWithImpl(this._self, this._then);

  final VariationsOpenedEvent _self;
  final $Res Function(VariationsOpenedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? cardId = null,}) {
  return _then(VariationsOpenedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AiSuggestionsRequestedEvent extends AnalyticsEvent {
  const AiSuggestionsRequestedEvent({required this.bondRef, required this.aiKind, required this.result, required this.count}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// New questions or variations of a card.
 final  AiSuggestionKind aiKind;
/// Outcome of the call.
 final  AiSuggestionOutcome result;
/// Number of suggestions returned.
 final  int count;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiSuggestionsRequestedEventCopyWith<AiSuggestionsRequestedEvent> get copyWith => _$AiSuggestionsRequestedEventCopyWithImpl<AiSuggestionsRequestedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiSuggestionsRequestedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.aiKind, aiKind) || other.aiKind == aiKind)&&(identical(other.result, result) || other.result == result)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,aiKind,result,count);

@override
String toString() {
  return 'AnalyticsEvent.aiSuggestionsRequested(bondRef: $bondRef, aiKind: $aiKind, result: $result, count: $count)';
}


}

/// @nodoc
abstract mixin class $AiSuggestionsRequestedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $AiSuggestionsRequestedEventCopyWith(AiSuggestionsRequestedEvent value, $Res Function(AiSuggestionsRequestedEvent) _then) = _$AiSuggestionsRequestedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, AiSuggestionKind aiKind, AiSuggestionOutcome result, int count
});




}
/// @nodoc
class _$AiSuggestionsRequestedEventCopyWithImpl<$Res>
    implements $AiSuggestionsRequestedEventCopyWith<$Res> {
  _$AiSuggestionsRequestedEventCopyWithImpl(this._self, this._then);

  final AiSuggestionsRequestedEvent _self;
  final $Res Function(AiSuggestionsRequestedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? aiKind = null,Object? result = null,Object? count = null,}) {
  return _then(AiSuggestionsRequestedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,aiKind: null == aiKind ? _self.aiKind : aiKind // ignore: cast_nullable_to_non_nullable
as AiSuggestionKind,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as AiSuggestionOutcome,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MilestoneCelebratedEvent extends AnalyticsEvent {
  const MilestoneCelebratedEvent({required this.bondRef, required this.milestone}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Milestone celebrated.
 final  MilestoneId milestone;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneCelebratedEventCopyWith<MilestoneCelebratedEvent> get copyWith => _$MilestoneCelebratedEventCopyWithImpl<MilestoneCelebratedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneCelebratedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,milestone);

@override
String toString() {
  return 'AnalyticsEvent.milestoneCelebrated(bondRef: $bondRef, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class $MilestoneCelebratedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $MilestoneCelebratedEventCopyWith(MilestoneCelebratedEvent value, $Res Function(MilestoneCelebratedEvent) _then) = _$MilestoneCelebratedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, MilestoneId milestone
});




}
/// @nodoc
class _$MilestoneCelebratedEventCopyWithImpl<$Res>
    implements $MilestoneCelebratedEventCopyWith<$Res> {
  _$MilestoneCelebratedEventCopyWithImpl(this._self, this._then);

  final MilestoneCelebratedEvent _self;
  final $Res Function(MilestoneCelebratedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? milestone = null,}) {
  return _then(MilestoneCelebratedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as MilestoneId,
  ));
}


}

/// @nodoc


class CheckpointViewedEvent extends AnalyticsEvent {
  const CheckpointViewedEvent({required this.bondRef, required this.topicsCovered, required this.topicsTotal}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Topics of the bond intent already covered.
 final  int topicsCovered;
/// Total topics of the bond intent.
 final  int topicsTotal;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckpointViewedEventCopyWith<CheckpointViewedEvent> get copyWith => _$CheckpointViewedEventCopyWithImpl<CheckpointViewedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckpointViewedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.topicsCovered, topicsCovered) || other.topicsCovered == topicsCovered)&&(identical(other.topicsTotal, topicsTotal) || other.topicsTotal == topicsTotal));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,topicsCovered,topicsTotal);

@override
String toString() {
  return 'AnalyticsEvent.checkpointViewed(bondRef: $bondRef, topicsCovered: $topicsCovered, topicsTotal: $topicsTotal)';
}


}

/// @nodoc
abstract mixin class $CheckpointViewedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $CheckpointViewedEventCopyWith(CheckpointViewedEvent value, $Res Function(CheckpointViewedEvent) _then) = _$CheckpointViewedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, int topicsCovered, int topicsTotal
});




}
/// @nodoc
class _$CheckpointViewedEventCopyWithImpl<$Res>
    implements $CheckpointViewedEventCopyWith<$Res> {
  _$CheckpointViewedEventCopyWithImpl(this._self, this._then);

  final CheckpointViewedEvent _self;
  final $Res Function(CheckpointViewedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? topicsCovered = null,Object? topicsTotal = null,}) {
  return _then(CheckpointViewedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,topicsCovered: null == topicsCovered ? _self.topicsCovered : topicsCovered // ignore: cast_nullable_to_non_nullable
as int,topicsTotal: null == topicsTotal ? _self.topicsTotal : topicsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RecommendedGoalTappedEvent extends AnalyticsEvent {
  const RecommendedGoalTappedEvent({required this.bondRef, required this.topicId}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Topic id of the recommended goal.
 final  String topicId;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedGoalTappedEventCopyWith<RecommendedGoalTappedEvent> get copyWith => _$RecommendedGoalTappedEventCopyWithImpl<RecommendedGoalTappedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedGoalTappedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.topicId, topicId) || other.topicId == topicId));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,topicId);

@override
String toString() {
  return 'AnalyticsEvent.recommendedGoalTapped(bondRef: $bondRef, topicId: $topicId)';
}


}

/// @nodoc
abstract mixin class $RecommendedGoalTappedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $RecommendedGoalTappedEventCopyWith(RecommendedGoalTappedEvent value, $Res Function(RecommendedGoalTappedEvent) _then) = _$RecommendedGoalTappedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, String topicId
});




}
/// @nodoc
class _$RecommendedGoalTappedEventCopyWithImpl<$Res>
    implements $RecommendedGoalTappedEventCopyWith<$Res> {
  _$RecommendedGoalTappedEventCopyWithImpl(this._self, this._then);

  final RecommendedGoalTappedEvent _self;
  final $Res Function(RecommendedGoalTappedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? topicId = null,}) {
  return _then(RecommendedGoalTappedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReminderSetEvent extends AnalyticsEvent {
  const ReminderSetEvent({required this.bondRef, required this.enabled, required this.weekday}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;
/// Whether the reminder is on.
 final  bool enabled;
/// Weekday of the reminder, 1 to 7.
 final  int weekday;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderSetEventCopyWith<ReminderSetEvent> get copyWith => _$ReminderSetEventCopyWithImpl<ReminderSetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderSetEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.weekday, weekday) || other.weekday == weekday));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef,enabled,weekday);

@override
String toString() {
  return 'AnalyticsEvent.reminderSet(bondRef: $bondRef, enabled: $enabled, weekday: $weekday)';
}


}

/// @nodoc
abstract mixin class $ReminderSetEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $ReminderSetEventCopyWith(ReminderSetEvent value, $Res Function(ReminderSetEvent) _then) = _$ReminderSetEventCopyWithImpl;
@useResult
$Res call({
 String bondRef, bool enabled, int weekday
});




}
/// @nodoc
class _$ReminderSetEventCopyWithImpl<$Res>
    implements $ReminderSetEventCopyWith<$Res> {
  _$ReminderSetEventCopyWithImpl(this._self, this._then);

  final ReminderSetEvent _self;
  final $Res Function(ReminderSetEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,Object? enabled = null,Object? weekday = null,}) {
  return _then(ReminderSetEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ReminderOpenedEvent extends AnalyticsEvent {
  const ReminderOpenedEvent({required this.bondRef}): super._();
  

/// Pseudonymous random id of the bond (`bonds.analyticsRef`).
 final  String bondRef;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderOpenedEventCopyWith<ReminderOpenedEvent> get copyWith => _$ReminderOpenedEventCopyWithImpl<ReminderOpenedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderOpenedEvent&&(identical(other.bondRef, bondRef) || other.bondRef == bondRef));
}


@override
int get hashCode => Object.hash(runtimeType,bondRef);

@override
String toString() {
  return 'AnalyticsEvent.reminderOpened(bondRef: $bondRef)';
}


}

/// @nodoc
abstract mixin class $ReminderOpenedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $ReminderOpenedEventCopyWith(ReminderOpenedEvent value, $Res Function(ReminderOpenedEvent) _then) = _$ReminderOpenedEventCopyWithImpl;
@useResult
$Res call({
 String bondRef
});




}
/// @nodoc
class _$ReminderOpenedEventCopyWithImpl<$Res>
    implements $ReminderOpenedEventCopyWith<$Res> {
  _$ReminderOpenedEventCopyWithImpl(this._self, this._then);

  final ReminderOpenedEvent _self;
  final $Res Function(ReminderOpenedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bondRef = null,}) {
  return _then(ReminderOpenedEvent(
bondRef: null == bondRef ? _self.bondRef : bondRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PushOpenedEvent extends AnalyticsEvent {
  const PushOpenedEvent({required this.pushKind}): super._();
  

/// Kind of push opened.
 final  PushKind pushKind;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushOpenedEventCopyWith<PushOpenedEvent> get copyWith => _$PushOpenedEventCopyWithImpl<PushOpenedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushOpenedEvent&&(identical(other.pushKind, pushKind) || other.pushKind == pushKind));
}


@override
int get hashCode => Object.hash(runtimeType,pushKind);

@override
String toString() {
  return 'AnalyticsEvent.pushOpened(pushKind: $pushKind)';
}


}

/// @nodoc
abstract mixin class $PushOpenedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $PushOpenedEventCopyWith(PushOpenedEvent value, $Res Function(PushOpenedEvent) _then) = _$PushOpenedEventCopyWithImpl;
@useResult
$Res call({
 PushKind pushKind
});




}
/// @nodoc
class _$PushOpenedEventCopyWithImpl<$Res>
    implements $PushOpenedEventCopyWith<$Res> {
  _$PushOpenedEventCopyWithImpl(this._self, this._then);

  final PushOpenedEvent _self;
  final $Res Function(PushOpenedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pushKind = null,}) {
  return _then(PushOpenedEvent(
pushKind: null == pushKind ? _self.pushKind : pushKind // ignore: cast_nullable_to_non_nullable
as PushKind,
  ));
}


}

/// @nodoc


class PaywallViewedEvent extends AnalyticsEvent {
  const PaywallViewedEvent({required this.familyRef, required this.daysSinceFamilyCreated, required this.isOwner}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Days elapsed since the family was created.
 final  int daysSinceFamilyCreated;
/// Whether the viewer owns the family.
 final  bool isOwner;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallViewedEventCopyWith<PaywallViewedEvent> get copyWith => _$PaywallViewedEventCopyWithImpl<PaywallViewedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallViewedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.daysSinceFamilyCreated, daysSinceFamilyCreated) || other.daysSinceFamilyCreated == daysSinceFamilyCreated)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef,daysSinceFamilyCreated,isOwner);

@override
String toString() {
  return 'AnalyticsEvent.paywallViewed(familyRef: $familyRef, daysSinceFamilyCreated: $daysSinceFamilyCreated, isOwner: $isOwner)';
}


}

/// @nodoc
abstract mixin class $PaywallViewedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $PaywallViewedEventCopyWith(PaywallViewedEvent value, $Res Function(PaywallViewedEvent) _then) = _$PaywallViewedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef, int daysSinceFamilyCreated, bool isOwner
});




}
/// @nodoc
class _$PaywallViewedEventCopyWithImpl<$Res>
    implements $PaywallViewedEventCopyWith<$Res> {
  _$PaywallViewedEventCopyWithImpl(this._self, this._then);

  final PaywallViewedEvent _self;
  final $Res Function(PaywallViewedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,Object? daysSinceFamilyCreated = null,Object? isOwner = null,}) {
  return _then(PaywallViewedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,daysSinceFamilyCreated: null == daysSinceFamilyCreated ? _self.daysSinceFamilyCreated : daysSinceFamilyCreated // ignore: cast_nullable_to_non_nullable
as int,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SubscribeTappedEvent extends AnalyticsEvent {
  const SubscribeTappedEvent({required this.familyRef, required this.plan}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;
/// Plan the person tapped.
 final  SubscriptionPlan plan;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeTappedEventCopyWith<SubscribeTappedEvent> get copyWith => _$SubscribeTappedEventCopyWithImpl<SubscribeTappedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeTappedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef)&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef,plan);

@override
String toString() {
  return 'AnalyticsEvent.subscribeTapped(familyRef: $familyRef, plan: $plan)';
}


}

/// @nodoc
abstract mixin class $SubscribeTappedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $SubscribeTappedEventCopyWith(SubscribeTappedEvent value, $Res Function(SubscribeTappedEvent) _then) = _$SubscribeTappedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef, SubscriptionPlan plan
});




}
/// @nodoc
class _$SubscribeTappedEventCopyWithImpl<$Res>
    implements $SubscribeTappedEventCopyWith<$Res> {
  _$SubscribeTappedEventCopyWithImpl(this._self, this._then);

  final SubscribeTappedEvent _self;
  final $Res Function(SubscribeTappedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,Object? plan = null,}) {
  return _then(SubscribeTappedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as SubscriptionPlan,
  ));
}


}

/// @nodoc


class PaywallDismissedEvent extends AnalyticsEvent {
  const PaywallDismissedEvent({required this.familyRef}): super._();
  

/// Pseudonymous random id of the family (`families.analyticsRef`).
 final  String familyRef;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallDismissedEventCopyWith<PaywallDismissedEvent> get copyWith => _$PaywallDismissedEventCopyWithImpl<PaywallDismissedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallDismissedEvent&&(identical(other.familyRef, familyRef) || other.familyRef == familyRef));
}


@override
int get hashCode => Object.hash(runtimeType,familyRef);

@override
String toString() {
  return 'AnalyticsEvent.paywallDismissed(familyRef: $familyRef)';
}


}

/// @nodoc
abstract mixin class $PaywallDismissedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $PaywallDismissedEventCopyWith(PaywallDismissedEvent value, $Res Function(PaywallDismissedEvent) _then) = _$PaywallDismissedEventCopyWithImpl;
@useResult
$Res call({
 String familyRef
});




}
/// @nodoc
class _$PaywallDismissedEventCopyWithImpl<$Res>
    implements $PaywallDismissedEventCopyWith<$Res> {
  _$PaywallDismissedEventCopyWithImpl(this._self, this._then);

  final PaywallDismissedEvent _self;
  final $Res Function(PaywallDismissedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? familyRef = null,}) {
  return _then(PaywallDismissedEvent(
familyRef: null == familyRef ? _self.familyRef : familyRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SettingChangedEvent extends AnalyticsEvent {
  const SettingChangedEvent({required this.key, required this.value}): super._();
  

/// Setting that changed.
 final  SettingKey key;
/// New value of the setting: always the `name` or `wireName` of the enum
/// backing [key], or `'true'` / `'false'` for a boolean setting. Never free
/// text.
 final  String value;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingChangedEventCopyWith<SettingChangedEvent> get copyWith => _$SettingChangedEventCopyWithImpl<SettingChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingChangedEvent&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'AnalyticsEvent.settingChanged(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SettingChangedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $SettingChangedEventCopyWith(SettingChangedEvent value, $Res Function(SettingChangedEvent) _then) = _$SettingChangedEventCopyWithImpl;
@useResult
$Res call({
 SettingKey key, String value
});




}
/// @nodoc
class _$SettingChangedEventCopyWithImpl<$Res>
    implements $SettingChangedEventCopyWith<$Res> {
  _$SettingChangedEventCopyWithImpl(this._self, this._then);

  final SettingChangedEvent _self;
  final $Res Function(SettingChangedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(SettingChangedEvent(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as SettingKey,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AccountDeletedEvent extends AnalyticsEvent {
  const AccountDeletedEvent({required this.accountType}): super._();
  

/// Kind of account being deleted.
 final  AccountDeletionType accountType;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeletedEventCopyWith<AccountDeletedEvent> get copyWith => _$AccountDeletedEventCopyWithImpl<AccountDeletedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeletedEvent&&(identical(other.accountType, accountType) || other.accountType == accountType));
}


@override
int get hashCode => Object.hash(runtimeType,accountType);

@override
String toString() {
  return 'AnalyticsEvent.accountDeleted(accountType: $accountType)';
}


}

/// @nodoc
abstract mixin class $AccountDeletedEventCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory $AccountDeletedEventCopyWith(AccountDeletedEvent value, $Res Function(AccountDeletedEvent) _then) = _$AccountDeletedEventCopyWithImpl;
@useResult
$Res call({
 AccountDeletionType accountType
});




}
/// @nodoc
class _$AccountDeletedEventCopyWithImpl<$Res>
    implements $AccountDeletedEventCopyWith<$Res> {
  _$AccountDeletedEventCopyWithImpl(this._self, this._then);

  final AccountDeletedEvent _self;
  final $Res Function(AccountDeletedEvent) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountType = null,}) {
  return _then(AccountDeletedEvent(
accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountDeletionType,
  ));
}


}

// dart format on
