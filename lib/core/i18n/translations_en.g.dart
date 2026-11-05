///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key) ?? super[key];

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$tabs$en tabs = _Translations$tabs$en._(_root);
	@override late final _Translations$placeholder$en placeholder = _Translations$placeholder$en._(_root);
	@override late final _Translations$errors$en errors = _Translations$errors$en._(_root);
	@override late final _Translations$profileUnavailable$en profileUnavailable = _Translations$profileUnavailable$en._(_root);
	@override late final _Translations$welcome$en welcome = _Translations$welcome$en._(_root);
	@override late final _Translations$signIn$en signIn = _Translations$signIn$en._(_root);
	@override late final _Translations$age$en age = _Translations$age$en._(_root);
	@override late final _Translations$createFamily$en createFamily = _Translations$createFamily$en._(_root);
	@override late final _Translations$screens$en screens = _Translations$screens$en._(_root);
}

// Path: tabs
class _Translations$tabs$en extends Translations$tabs$es {
	_Translations$tabs$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get garden => 'Garden';
	@override String get questions => 'Questions';
	@override String get stories => 'Stories';
	@override String get settings => 'Settings';
}

// Path: placeholder
class _Translations$placeholder$en extends Translations$placeholder$es {
	_Translations$placeholder$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get body => 'Screen under construction';
}

// Path: errors
class _Translations$errors$en extends Translations$errors$es {
	_Translations$errors$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get notFound => 'This screen does not exist';
	@override String get network => 'No connection. We\'ll try again.';
	@override String get generic => 'Something went wrong. Please try again.';
}

// Path: profileUnavailable
class _Translations$profileUnavailable$en extends Translations$profileUnavailable$es {
	_Translations$profileUnavailable$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'We couldn\'t load your profile';
	@override String get retry => 'Try again';
	@override String get signOut => 'Sign out';
}

// Path: welcome
class _Translations$welcome$en extends Translations$welcome$es {
	_Translations$welcome$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Stories that bring us closer';
	@override String get subtitle => 'Ask your family what you always wanted to know. And remember what you\'ve already told.';
	@override late final _Translations$welcome$language$en language = _Translations$welcome$language$en._(_root);
	@override late final _Translations$welcome$analytics$en analytics = _Translations$welcome$analytics$en._(_root);
	@override String get start => 'Get started';
}

// Path: signIn
class _Translations$signIn$en extends Translations$signIn$es {
	_Translations$signIn$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get google => 'Continue with Google';
	@override String get apple => 'Continue with Apple';
	@override String get haveCode => 'I have a code';
}

// Path: age
class _Translations$age$en extends Translations$age$es {
	_Translations$age$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'What year were you born?';
	@override String get yearLabel => 'Birth year';
	@override String get nameLabel => 'What\'s your name?';
	@override String get nameTooLong => 'That name is too long to save. Try a shorter one.';
	@override String get confirm => 'Continue';
	@override String get blocked => 'To use the app, ask your parent or guardian to create a profile for you from their phone.';
	@override String get cardLanguageTitle => 'Which language do you want the questions in?';
	@override String get cardLanguageEnglish => 'English only';
	@override String get cardLanguageSpanish => 'Spanish only';
	@override String get cardLanguageBilingual => 'Both languages';
	@override String get primaryLanguageTitle => 'Which one is shown first, larger?';
	@override String get primaryLanguageEnglish => 'English';
	@override String get primaryLanguageSpanish => 'Spanish';
}

// Path: createFamily
class _Translations$createFamily$en extends Translations$createFamily$es {
	_Translations$createFamily$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Name your family';
	@override String get subtitle => 'This is the space you will share. You can change it later.';
	@override String get nameLabel => 'Family name';
	@override String get nameHint => 'The Garcías';
	@override String get confirm => 'Create';
}

// Path: screens
class _Translations$screens$en extends Translations$screens$es {
	_Translations$screens$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _Translations$screens$signIn$en signIn = _Translations$screens$signIn$en._(_root);
	@override late final _Translations$screens$invite$en invite = _Translations$screens$invite$en._(_root);
	@override late final _Translations$screens$code$en code = _Translations$screens$code$en._(_root);
	@override late final _Translations$screens$bondNew$en bondNew = _Translations$screens$bondNew$en._(_root);
	@override late final _Translations$screens$bond$en bond = _Translations$screens$bond$en._(_root);
	@override late final _Translations$screens$bondAsk$en bondAsk = _Translations$screens$bondAsk$en._(_root);
	@override late final _Translations$screens$bondAskVariations$en bondAskVariations = _Translations$screens$bondAskVariations$en._(_root);
	@override late final _Translations$screens$bondTell$en bondTell = _Translations$screens$bondTell$en._(_root);
	@override late final _Translations$screens$bondAskDetail$en bondAskDetail = _Translations$screens$bondAskDetail$en._(_root);
	@override late final _Translations$screens$bondStory$en bondStory = _Translations$screens$bondStory$en._(_root);
	@override late final _Translations$screens$bondCheckpoint$en bondCheckpoint = _Translations$screens$bondCheckpoint$en._(_root);
	@override late final _Translations$screens$bondSettings$en bondSettings = _Translations$screens$bondSettings$en._(_root);
	@override late final _Translations$screens$family$en family = _Translations$screens$family$en._(_root);
	@override late final _Translations$screens$familyMinorNew$en familyMinorNew = _Translations$screens$familyMinorNew$en._(_root);
	@override late final _Translations$screens$familyMinorCode$en familyMinorCode = _Translations$screens$familyMinorCode$en._(_root);
	@override late final _Translations$screens$deleteAccount$en deleteAccount = _Translations$screens$deleteAccount$en._(_root);
	@override late final _Translations$screens$betaSubscription$en betaSubscription = _Translations$screens$betaSubscription$en._(_root);
}

// Path: welcome.language
class _Translations$welcome$language$en extends Translations$welcome$language$es {
	_Translations$welcome$language$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Language';
	@override String get es => 'Español';
	@override String get en => 'English';
}

// Path: welcome.analytics
class _Translations$welcome$analytics$en extends Translations$welcome$analytics$es {
	_Translations$welcome$analytics$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get question => 'Will you help us improve the app by sharing anonymous usage data?';
	@override String get yes => 'Yes, share';
	@override String get no => 'No, thanks';
}

// Path: screens.signIn
class _Translations$screens$signIn$en extends Translations$screens$signIn$es {
	_Translations$screens$signIn$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sign in';
}

// Path: screens.invite
class _Translations$screens$invite$en extends Translations$screens$invite$es {
	_Translations$screens$invite$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Invitation';
}

// Path: screens.code
class _Translations$screens$code$en extends Translations$screens$code$es {
	_Translations$screens$code$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Code';
}

// Path: screens.bondNew
class _Translations$screens$bondNew$en extends Translations$screens$bondNew$es {
	_Translations$screens$bondNew$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'New bond';
}

// Path: screens.bond
class _Translations$screens$bond$en extends Translations$screens$bond$es {
	_Translations$screens$bond$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bond';
}

// Path: screens.bondAsk
class _Translations$screens$bondAsk$en extends Translations$screens$bondAsk$es {
	_Translations$screens$bondAsk$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ask';
}

// Path: screens.bondAskVariations
class _Translations$screens$bondAskVariations$en extends Translations$screens$bondAskVariations$es {
	_Translations$screens$bondAskVariations$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variations';
}

// Path: screens.bondTell
class _Translations$screens$bondTell$en extends Translations$screens$bondTell$es {
	_Translations$screens$bondTell$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tell';
}

// Path: screens.bondAskDetail
class _Translations$screens$bondAskDetail$en extends Translations$screens$bondAskDetail$es {
	_Translations$screens$bondAskDetail$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Question';
}

// Path: screens.bondStory
class _Translations$screens$bondStory$en extends Translations$screens$bondStory$es {
	_Translations$screens$bondStory$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Story';
}

// Path: screens.bondCheckpoint
class _Translations$screens$bondCheckpoint$en extends Translations$screens$bondCheckpoint$es {
	_Translations$screens$bondCheckpoint$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Checkpoint';
}

// Path: screens.bondSettings
class _Translations$screens$bondSettings$en extends Translations$screens$bondSettings$es {
	_Translations$screens$bondSettings$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bond settings';
}

// Path: screens.family
class _Translations$screens$family$en extends Translations$screens$family$es {
	_Translations$screens$family$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Family';
}

// Path: screens.familyMinorNew
class _Translations$screens$familyMinorNew$en extends Translations$screens$familyMinorNew$es {
	_Translations$screens$familyMinorNew$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'New minor profile';
}

// Path: screens.familyMinorCode
class _Translations$screens$familyMinorCode$en extends Translations$screens$familyMinorCode$es {
	_Translations$screens$familyMinorCode$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minor code';
}

// Path: screens.deleteAccount
class _Translations$screens$deleteAccount$en extends Translations$screens$deleteAccount$es {
	_Translations$screens$deleteAccount$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Delete account';
}

// Path: screens.betaSubscription
class _Translations$screens$betaSubscription$en extends Translations$screens$betaSubscription$es {
	_Translations$screens$betaSubscription$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subscription';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'tabs.garden' => 'Garden',
			'tabs.questions' => 'Questions',
			'tabs.stories' => 'Stories',
			'tabs.settings' => 'Settings',
			'placeholder.body' => 'Screen under construction',
			'errors.notFound' => 'This screen does not exist',
			'errors.network' => 'No connection. We\'ll try again.',
			'errors.generic' => 'Something went wrong. Please try again.',
			'profileUnavailable.title' => 'We couldn\'t load your profile',
			'profileUnavailable.retry' => 'Try again',
			'profileUnavailable.signOut' => 'Sign out',
			'welcome.title' => 'Stories that bring us closer',
			'welcome.subtitle' => 'Ask your family what you always wanted to know. And remember what you\'ve already told.',
			'welcome.language.label' => 'Language',
			'welcome.language.es' => 'Español',
			'welcome.language.en' => 'English',
			'welcome.analytics.question' => 'Will you help us improve the app by sharing anonymous usage data?',
			'welcome.analytics.yes' => 'Yes, share',
			'welcome.analytics.no' => 'No, thanks',
			'welcome.start' => 'Get started',
			'signIn.google' => 'Continue with Google',
			'signIn.apple' => 'Continue with Apple',
			'signIn.haveCode' => 'I have a code',
			'age.title' => 'What year were you born?',
			'age.yearLabel' => 'Birth year',
			'age.nameLabel' => 'What\'s your name?',
			'age.nameTooLong' => 'That name is too long to save. Try a shorter one.',
			'age.confirm' => 'Continue',
			'age.blocked' => 'To use the app, ask your parent or guardian to create a profile for you from their phone.',
			'age.cardLanguageTitle' => 'Which language do you want the questions in?',
			'age.cardLanguageEnglish' => 'English only',
			'age.cardLanguageSpanish' => 'Spanish only',
			'age.cardLanguageBilingual' => 'Both languages',
			'age.primaryLanguageTitle' => 'Which one is shown first, larger?',
			'age.primaryLanguageEnglish' => 'English',
			'age.primaryLanguageSpanish' => 'Spanish',
			'createFamily.title' => 'Name your family',
			'createFamily.subtitle' => 'This is the space you will share. You can change it later.',
			'createFamily.nameLabel' => 'Family name',
			'createFamily.nameHint' => 'The Garcías',
			'createFamily.confirm' => 'Create',
			'screens.signIn.title' => 'Sign in',
			'screens.invite.title' => 'Invitation',
			'screens.code.title' => 'Code',
			'screens.bondNew.title' => 'New bond',
			'screens.bond.title' => 'Bond',
			'screens.bondAsk.title' => 'Ask',
			'screens.bondAskVariations.title' => 'Variations',
			'screens.bondTell.title' => 'Tell',
			'screens.bondAskDetail.title' => 'Question',
			'screens.bondStory.title' => 'Story',
			'screens.bondCheckpoint.title' => 'Checkpoint',
			'screens.bondSettings.title' => 'Bond settings',
			'screens.family.title' => 'Family',
			'screens.familyMinorNew.title' => 'New minor profile',
			'screens.familyMinorCode.title' => 'Minor code',
			'screens.deleteAccount.title' => 'Delete account',
			'screens.betaSubscription.title' => 'Subscription',
			_ => null,
		};
	}
}
