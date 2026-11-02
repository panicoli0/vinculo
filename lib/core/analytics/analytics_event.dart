import 'package:freezed_annotation/freezed_annotation.dart';

// core/analytics depende a propósito del domain/ de las features (y solo del
// domain/): la tabla de eventos de docs/analytics.md §3 está tipada con esos
// enums. Nunca viaja un nombre, año de nacimiento, texto de nota/respuesta,
// pregunta escrita o generada, código de invitación ni un uid de Firebase.

import '../../features/auth/domain/account_deletion_type.dart';
import '../../features/auth/domain/sign_in_method.dart';
import '../../features/beta/domain/subscription_plan.dart';
import '../../features/bonds/domain/bond_origin.dart';
import '../../features/bonds/domain/connection_intent.dart';
import '../../features/bonds/domain/question_direction.dart';
import '../../features/bonds/domain/relationship_type.dart';
import '../../features/family/domain/invite_kind.dart';
import '../../features/family/domain/joined_via.dart';
import '../../features/notifications/domain/push_kind.dart';
import '../../features/progress/domain/milestone_id.dart';
import '../../features/questions/domain/ai_suggestion_kind.dart';
import '../../features/questions/domain/ai_suggestion_outcome.dart';
import '../../features/stories/domain/question_source.dart';
import '../../features/stories/domain/telling_mode.dart';
import 'setting_key.dart';

part 'analytics_event.freezed.dart';

/// Typed catalogue of the product analytics events (docs/analytics.md §3).
///
/// The table is frozen: no event or parameter is renamed, added or dropped
/// without a PO decision. Parameters are all required; a value that does not
/// apply is `''` for strings and `-1` for ints (analytics.md §2).
@freezed
sealed class AnalyticsEvent with _$AnalyticsEvent {
  /// A sign-in succeeded.
  const factory AnalyticsEvent.signInCompleted({
    /// Method used to sign in.
    required SignInMethod method,

    /// Whether the account was just created.
    required bool isNewUser,
  }) = SignInCompletedEvent;

  /// A family was created.
  const factory AnalyticsEvent.familyCreated({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,
  }) = FamilyCreatedEvent;

  /// The server returned an invite or a code.
  const factory AnalyticsEvent.inviteCreated({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Whether the invite is for an adult or a minor.
    required InviteKind kind,

    /// Pseudonymous random id of the invite (`invites.analyticsRef`).
    required String inviteRef,

    /// Whether the invite carries a bond proposal.
    required bool hasBondProposal,

    /// Whether the invite carries a first question.
    required bool hasFirstQuestion,
  }) = InviteCreatedEvent;

  /// An invite was redeemed on the invitee's phone.
  const factory AnalyticsEvent.inviteAccepted({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Whether the invite was for an adult or a minor.
    required InviteKind kind,

    /// Pseudonymous random id of the invite (`invites.analyticsRef`).
    required String inviteRef,

    /// Hours elapsed since the invite was created.
    required int hoursSinceInvite,
  }) = InviteAcceptedEvent;

  /// The server created a minor profile.
  const factory AnalyticsEvent.minorProfileCreated({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Whether parental consent is required.
    required bool consentRequired,
  }) = MinorProfileCreatedEvent;

  /// A bond was created.
  const factory AnalyticsEvent.bondCreated({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Relationship type of the bond.
    required RelationshipType relationship,

    /// Intent chosen for the bond.
    required ConnectionIntent intent,

    /// Whether the bond was created manually or from an invite.
    required BondOrigin origin,
  }) = BondCreatedEvent;

  /// The intent of a bond changed.
  const factory AnalyticsEvent.intentChanged({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Intent before the change.
    required ConnectionIntent fromIntent,

    /// Intent after the change.
    required ConnectionIntent toIntent,
  }) = IntentChangedEvent;

  /// A question was created.
  const factory AnalyticsEvent.questionSent({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Where the question came from.
    required QuestionSource source,

    /// Whether it is a variation of a curated card.
    required bool isVariation,

    /// Curated card id; `''` when not applicable (user-written or new AI question).
    required String cardId,

    /// Topic id; `''` when the question has no topic.
    required String topicId,

    /// Direction of the question within the bond.
    required QuestionDirection direction,

    /// Whether the teller already told this to the asker.
    required bool alreadyToldToAsker,
  }) = QuestionSentEvent;

  /// A curated card equivalent to the typed question was suggested.
  const factory AnalyticsEvent.customMatchSuggested({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Curated card id.
    required String cardId,
  }) = CustomMatchSuggestedEvent;

  /// The suggested curated card was chosen.
  const factory AnalyticsEvent.customMatchAccepted({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Curated card id.
    required String cardId,
  }) = CustomMatchAcceptedEvent;

  /// The teller opened a received question.
  const factory AnalyticsEvent.questionOpened({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Where the question came from.
    required QuestionSource source,

    /// How many other listeners already heard it from the teller.
    required int alreadyToldCount,

    /// Whether the teller already told this to the asker.
    required bool alreadyToldToAsker,

    /// Hours elapsed since the question was sent.
    required int hoursSinceSent,
  }) = QuestionOpenedEvent;

  /// A story was created.
  const factory AnalyticsEvent.storyTold({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Written, or told offline.
    required TellingMode mode,

    /// Where the question came from.
    required QuestionSource source,

    /// Whether it answers a received question.
    required bool fromAsk,

    /// Whether the teller attached a note.
    required bool hasNote,

    /// How many other listeners already heard it from the teller.
    required int alreadyToldCount,

    /// Hours elapsed since the question; `-1` when there is no question.
    required int hoursSinceAsk,
  }) = StoryToldEvent;

  /// The person answered a question for the first time.
  const factory AnalyticsEvent.firstQuestionAnswered({
    /// How the person joined the family.
    required JoinedVia joinedVia,

    /// Pseudonymous random id of the invite; `''` for the owner.
    required String inviteRef,

    /// Hours elapsed since the invite was created; `-1` for the owner.
    required int hoursSinceInvite,
  }) = FirstQuestionAnsweredEvent;

  /// The teller reminded the asker that they already told it.
  const factory AnalyticsEvent.alreadyToldReminded({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,
  }) = AlreadyToldRemindedEvent;

  /// The teller preferred not to answer.
  const factory AnalyticsEvent.askDeclined({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Where the question came from.
    required QuestionSource source,
  }) = AskDeclinedEvent;

  /// The listener added a note.
  const factory AnalyticsEvent.listenerNoteAdded({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,
  }) = ListenerNoteAddedEvent;

  /// The variations of a card were opened.
  const factory AnalyticsEvent.variationsOpened({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Curated card id.
    required String cardId,
  }) = VariationsOpenedEvent;

  /// An AI suggestions call returned.
  const factory AnalyticsEvent.aiSuggestionsRequested({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// New questions or variations of a card.
    required AiSuggestionKind aiKind,

    /// Outcome of the call.
    required AiSuggestionOutcome result,

    /// Number of suggestions returned.
    required int count,
  }) = AiSuggestionsRequestedEvent;

  /// The app showed a new milestone.
  const factory AnalyticsEvent.milestoneCelebrated({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Milestone celebrated.
    required MilestoneId milestone,
  }) = MilestoneCelebratedEvent;

  /// The bond checkpoint was opened.
  const factory AnalyticsEvent.checkpointViewed({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Topics of the bond intent already covered.
    required int topicsCovered,

    /// Total topics of the bond intent.
    required int topicsTotal,
  }) = CheckpointViewedEvent;

  /// The next recommended goal was tapped.
  const factory AnalyticsEvent.recommendedGoalTapped({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Topic id of the recommended goal.
    required String topicId,
  }) = RecommendedGoalTappedEvent;

  /// A reminder was saved.
  const factory AnalyticsEvent.reminderSet({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,

    /// Whether the reminder is on.
    required bool enabled,

    /// Weekday of the reminder, 1 to 7.
    required int weekday,
  }) = ReminderSetEvent;

  /// The app was opened from a reminder.
  const factory AnalyticsEvent.reminderOpened({
    /// Pseudonymous random id of the bond (`bonds.analyticsRef`).
    required String bondRef,
  }) = ReminderOpenedEvent;

  /// The app was opened from a push notification.
  const factory AnalyticsEvent.pushOpened({
    /// Kind of push opened.
    required PushKind pushKind,
  }) = PushOpenedEvent;

  /// The subscription fake door was shown.
  const factory AnalyticsEvent.paywallViewed({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Days elapsed since the family was created.
    required int daysSinceFamilyCreated,

    /// Whether the viewer owns the family.
    required bool isOwner,
  }) = PaywallViewedEvent;

  /// "I want to subscribe" was tapped.
  const factory AnalyticsEvent.subscribeTapped({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,

    /// Plan the person tapped.
    required SubscriptionPlan plan,
  }) = SubscribeTappedEvent;

  /// The fake door was dismissed with "Not now".
  const factory AnalyticsEvent.paywallDismissed({
    /// Pseudonymous random id of the family (`families.analyticsRef`).
    required String familyRef,
  }) = PaywallDismissedEvent;

  /// A setting changed.
  const factory AnalyticsEvent.settingChanged({
    /// Setting that changed.
    required SettingKey key,

    /// New value of the setting: always the `name` or `wireName` of the enum
    /// backing [key], or `'true'` / `'false'` for a boolean setting. Never free
    /// text.
    required String value,
  }) = SettingChangedEvent;

  /// Logged before calling the deletion Function.
  const factory AnalyticsEvent.accountDeleted({
    /// Kind of account being deleted.
    required AccountDeletionType accountType,
  }) = AccountDeletedEvent;

  const AnalyticsEvent._();

  /// Snake case event name as defined by docs/analytics.md §3.
  String get name => switch (this) {
    SignInCompletedEvent() => 'sign_in_completed',
    FamilyCreatedEvent() => 'family_created',
    InviteCreatedEvent() => 'invite_created',
    InviteAcceptedEvent() => 'invite_accepted',
    MinorProfileCreatedEvent() => 'minor_profile_created',
    BondCreatedEvent() => 'bond_created',
    IntentChangedEvent() => 'intent_changed',
    QuestionSentEvent() => 'question_sent',
    CustomMatchSuggestedEvent() => 'custom_match_suggested',
    CustomMatchAcceptedEvent() => 'custom_match_accepted',
    QuestionOpenedEvent() => 'question_opened',
    StoryToldEvent() => 'story_told',
    FirstQuestionAnsweredEvent() => 'first_question_answered',
    AlreadyToldRemindedEvent() => 'already_told_reminded',
    AskDeclinedEvent() => 'ask_declined',
    ListenerNoteAddedEvent() => 'listener_note_added',
    VariationsOpenedEvent() => 'variations_opened',
    AiSuggestionsRequestedEvent() => 'ai_suggestions_requested',
    MilestoneCelebratedEvent() => 'milestone_celebrated',
    CheckpointViewedEvent() => 'checkpoint_viewed',
    RecommendedGoalTappedEvent() => 'recommended_goal_tapped',
    ReminderSetEvent() => 'reminder_set',
    ReminderOpenedEvent() => 'reminder_opened',
    PushOpenedEvent() => 'push_opened',
    PaywallViewedEvent() => 'paywall_viewed',
    SubscribeTappedEvent() => 'subscribe_tapped',
    PaywallDismissedEvent() => 'paywall_dismissed',
    SettingChangedEvent() => 'setting_changed',
    AccountDeletedEvent() => 'account_deleted',
  };

  /// Snake case parameters as defined by docs/analytics.md §3.
  Map<String, Object?> get parameters => switch (this) {
    SignInCompletedEvent(:final method, :final isNewUser) => <String, Object?>{
      'method': method.name,
      'is_new_user': isNewUser,
    },
    FamilyCreatedEvent(:final familyRef) => <String, Object?>{
      'family_ref': familyRef,
    },
    InviteCreatedEvent(
      :final familyRef,
      :final kind,
      :final inviteRef,
      :final hasBondProposal,
      :final hasFirstQuestion,
    ) =>
      <String, Object?>{
        'family_ref': familyRef,
        'kind': kind.name,
        'invite_ref': inviteRef,
        'has_bond_proposal': hasBondProposal,
        'has_first_question': hasFirstQuestion,
      },
    InviteAcceptedEvent(
      :final familyRef,
      :final kind,
      :final inviteRef,
      :final hoursSinceInvite,
    ) =>
      <String, Object?>{
        'family_ref': familyRef,
        'kind': kind.name,
        'invite_ref': inviteRef,
        'hours_since_invite': hoursSinceInvite,
      },
    MinorProfileCreatedEvent(:final familyRef, :final consentRequired) =>
      <String, Object?>{
        'family_ref': familyRef,
        'consent_required': consentRequired,
      },
    BondCreatedEvent(
      :final bondRef,
      :final familyRef,
      :final relationship,
      :final intent,
      :final origin,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'family_ref': familyRef,
        'relationship': relationship.name,
        'intent': intent.name,
        'origin': origin.name,
      },
    IntentChangedEvent(:final bondRef, :final fromIntent, :final toIntent) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'from_intent': fromIntent.name,
        'to_intent': toIntent.name,
      },
    QuestionSentEvent(
      :final bondRef,
      :final source,
      :final isVariation,
      :final cardId,
      :final topicId,
      :final direction,
      :final alreadyToldToAsker,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'source': source.name,
        'is_variation': isVariation,
        'card_id': cardId,
        'topic_id': topicId,
        'direction': direction.name,
        'already_told_to_asker': alreadyToldToAsker,
      },
    CustomMatchSuggestedEvent(:final bondRef, :final cardId) =>
      <String, Object?>{'bond_ref': bondRef, 'card_id': cardId},
    CustomMatchAcceptedEvent(:final bondRef, :final cardId) =>
      <String, Object?>{'bond_ref': bondRef, 'card_id': cardId},
    QuestionOpenedEvent(
      :final bondRef,
      :final source,
      :final alreadyToldCount,
      :final alreadyToldToAsker,
      :final hoursSinceSent,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'source': source.name,
        'already_told_count': alreadyToldCount,
        'already_told_to_asker': alreadyToldToAsker,
        'hours_since_sent': hoursSinceSent,
      },
    StoryToldEvent(
      :final bondRef,
      :final mode,
      :final source,
      :final fromAsk,
      :final hasNote,
      :final alreadyToldCount,
      :final hoursSinceAsk,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'mode': mode.name,
        'source': source.name,
        'from_ask': fromAsk,
        'has_note': hasNote,
        'already_told_count': alreadyToldCount,
        'hours_since_ask': hoursSinceAsk,
      },
    FirstQuestionAnsweredEvent(
      :final joinedVia,
      :final inviteRef,
      :final hoursSinceInvite,
    ) =>
      <String, Object?>{
        'joined_via': joinedVia.name,
        'invite_ref': inviteRef,
        'hours_since_invite': hoursSinceInvite,
      },
    AlreadyToldRemindedEvent(:final bondRef) => <String, Object?>{
      'bond_ref': bondRef,
    },
    AskDeclinedEvent(:final bondRef, :final source) => <String, Object?>{
      'bond_ref': bondRef,
      'source': source.name,
    },
    ListenerNoteAddedEvent(:final bondRef) => <String, Object?>{
      'bond_ref': bondRef,
    },
    VariationsOpenedEvent(:final bondRef, :final cardId) => <String, Object?>{
      'bond_ref': bondRef,
      'card_id': cardId,
    },
    AiSuggestionsRequestedEvent(
      :final bondRef,
      :final aiKind,
      :final result,
      :final count,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'ai_kind': aiKind.wireName,
        'result': result.name,
        'count': count,
      },
    MilestoneCelebratedEvent(:final bondRef, :final milestone) =>
      <String, Object?>{'bond_ref': bondRef, 'milestone': milestone.name},
    CheckpointViewedEvent(
      :final bondRef,
      :final topicsCovered,
      :final topicsTotal,
    ) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'topics_covered': topicsCovered,
        'topics_total': topicsTotal,
      },
    RecommendedGoalTappedEvent(:final bondRef, :final topicId) =>
      <String, Object?>{'bond_ref': bondRef, 'topic_id': topicId},
    ReminderSetEvent(:final bondRef, :final enabled, :final weekday) =>
      <String, Object?>{
        'bond_ref': bondRef,
        'enabled': enabled,
        'weekday': weekday,
      },
    ReminderOpenedEvent(:final bondRef) => <String, Object?>{
      'bond_ref': bondRef,
    },
    PushOpenedEvent(:final pushKind) => <String, Object?>{
      'push_kind': pushKind.name,
    },
    PaywallViewedEvent(
      :final familyRef,
      :final daysSinceFamilyCreated,
      :final isOwner,
    ) =>
      <String, Object?>{
        'family_ref': familyRef,
        'days_since_family_created': daysSinceFamilyCreated,
        'is_owner': isOwner,
      },
    SubscribeTappedEvent(:final familyRef, :final plan) => <String, Object?>{
      'family_ref': familyRef,
      'plan': plan.name,
    },
    PaywallDismissedEvent(:final familyRef) => <String, Object?>{
      'family_ref': familyRef,
    },
    SettingChangedEvent(:final key, :final value) => <String, Object?>{
      'key': key.wireName,
      'value': value,
    },
    AccountDeletedEvent(:final accountType) => <String, Object?>{
      'account_type': accountType.name,
    },
  };
}
