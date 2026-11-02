///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEs = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$tabs$es tabs = Translations$tabs$es.internal(_root);
	late final Translations$placeholder$es placeholder = Translations$placeholder$es.internal(_root);
	late final Translations$errors$es errors = Translations$errors$es.internal(_root);
	late final Translations$profileUnavailable$es profileUnavailable = Translations$profileUnavailable$es.internal(_root);
	late final Translations$welcome$es welcome = Translations$welcome$es.internal(_root);
	late final Translations$signIn$es signIn = Translations$signIn$es.internal(_root);
	late final Translations$age$es age = Translations$age$es.internal(_root);
	late final Translations$createFamily$es createFamily = Translations$createFamily$es.internal(_root);
	late final Translations$screens$es screens = Translations$screens$es.internal(_root);
}

// Path: tabs
class Translations$tabs$es {
	Translations$tabs$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Jardín'
	String get garden => 'Jardín';

	/// es: 'Preguntas'
	String get questions => 'Preguntas';

	/// es: 'Historias'
	String get stories => 'Historias';

	/// es: 'Ajustes'
	String get settings => 'Ajustes';
}

// Path: placeholder
class Translations$placeholder$es {
	Translations$placeholder$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Pantalla en construcción'
	String get body => 'Pantalla en construcción';
}

// Path: errors
class Translations$errors$es {
	Translations$errors$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Esta pantalla no existe'
	String get notFound => 'Esta pantalla no existe';

	/// es: 'No hay conexión. Lo intentaremos de nuevo.'
	String get network => 'No hay conexión. Lo intentaremos de nuevo.';

	/// es: 'Algo salió mal. Intenta de nuevo.'
	String get generic => 'Algo salió mal. Intenta de nuevo.';
}

// Path: profileUnavailable
class Translations$profileUnavailable$es {
	Translations$profileUnavailable$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'No pudimos cargar tu perfil'
	String get title => 'No pudimos cargar tu perfil';

	/// es: 'Reintentar'
	String get retry => 'Reintentar';

	/// es: 'Cerrar sesión'
	String get signOut => 'Cerrar sesión';
}

// Path: welcome
class Translations$welcome$es {
	Translations$welcome$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Historias que nos unen'
	String get title => 'Historias que nos unen';

	/// es: 'Pregúntale a tu familia lo que siempre quisiste saber. Y recuerda lo que ya contaste.'
	String get subtitle => 'Pregúntale a tu familia lo que siempre quisiste saber. Y recuerda lo que ya contaste.';

	late final Translations$welcome$language$es language = Translations$welcome$language$es.internal(_root);
	late final Translations$welcome$analytics$es analytics = Translations$welcome$analytics$es.internal(_root);

	/// es: 'Empezar'
	String get start => 'Empezar';
}

// Path: signIn
class Translations$signIn$es {
	Translations$signIn$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Continuar con Google'
	String get google => 'Continuar con Google';

	/// es: 'Continuar con Apple'
	String get apple => 'Continuar con Apple';

	/// es: 'Tengo un código'
	String get haveCode => 'Tengo un código';
}

// Path: age
class Translations$age$es {
	Translations$age$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: '¿En qué año naciste?'
	String get title => '¿En qué año naciste?';

	/// es: 'Año de nacimiento'
	String get yearLabel => 'Año de nacimiento';

	/// es: '¿Cómo te llamas?'
	String get nameLabel => '¿Cómo te llamas?';

	/// es: 'Continuar'
	String get confirm => 'Continuar';

	/// es: 'Para usar la app, pídele a tu madre, padre o tutor que te cree un perfil desde su teléfono.'
	String get blocked => 'Para usar la app, pídele a tu madre, padre o tutor que te cree un perfil desde su teléfono.';

	/// es: '¿En qué idioma quieres ver las preguntas?'
	String get cardLanguageTitle => '¿En qué idioma quieres ver las preguntas?';

	/// es: 'Solo en inglés'
	String get cardLanguageEnglish => 'Solo en inglés';

	/// es: 'Solo en español'
	String get cardLanguageSpanish => 'Solo en español';

	/// es: 'En los dos idiomas'
	String get cardLanguageBilingual => 'En los dos idiomas';

	/// es: '¿Cuál se muestra primero, en grande?'
	String get primaryLanguageTitle => '¿Cuál se muestra primero, en grande?';

	/// es: 'Inglés'
	String get primaryLanguageEnglish => 'Inglés';

	/// es: 'Español'
	String get primaryLanguageSpanish => 'Español';
}

// Path: createFamily
class Translations$createFamily$es {
	Translations$createFamily$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ponle nombre a tu familia'
	String get title => 'Ponle nombre a tu familia';

	/// es: 'Es el espacio que van a compartir. Puedes cambiarlo después.'
	String get subtitle => 'Es el espacio que van a compartir. Puedes cambiarlo después.';

	/// es: 'Nombre de la familia'
	String get nameLabel => 'Nombre de la familia';

	/// es: 'Familia García'
	String get nameHint => 'Familia García';

	/// es: 'Crear'
	String get confirm => 'Crear';
}

// Path: screens
class Translations$screens$es {
	Translations$screens$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$screens$signIn$es signIn = Translations$screens$signIn$es.internal(_root);
	late final Translations$screens$invite$es invite = Translations$screens$invite$es.internal(_root);
	late final Translations$screens$code$es code = Translations$screens$code$es.internal(_root);
	late final Translations$screens$bondNew$es bondNew = Translations$screens$bondNew$es.internal(_root);
	late final Translations$screens$bond$es bond = Translations$screens$bond$es.internal(_root);
	late final Translations$screens$bondAsk$es bondAsk = Translations$screens$bondAsk$es.internal(_root);
	late final Translations$screens$bondAskVariations$es bondAskVariations = Translations$screens$bondAskVariations$es.internal(_root);
	late final Translations$screens$bondTell$es bondTell = Translations$screens$bondTell$es.internal(_root);
	late final Translations$screens$bondAskDetail$es bondAskDetail = Translations$screens$bondAskDetail$es.internal(_root);
	late final Translations$screens$bondStory$es bondStory = Translations$screens$bondStory$es.internal(_root);
	late final Translations$screens$bondCheckpoint$es bondCheckpoint = Translations$screens$bondCheckpoint$es.internal(_root);
	late final Translations$screens$bondSettings$es bondSettings = Translations$screens$bondSettings$es.internal(_root);
	late final Translations$screens$family$es family = Translations$screens$family$es.internal(_root);
	late final Translations$screens$familyMinorNew$es familyMinorNew = Translations$screens$familyMinorNew$es.internal(_root);
	late final Translations$screens$familyMinorCode$es familyMinorCode = Translations$screens$familyMinorCode$es.internal(_root);
	late final Translations$screens$deleteAccount$es deleteAccount = Translations$screens$deleteAccount$es.internal(_root);
	late final Translations$screens$betaSubscription$es betaSubscription = Translations$screens$betaSubscription$es.internal(_root);
}

// Path: welcome.language
class Translations$welcome$language$es {
	Translations$welcome$language$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Idioma'
	String get label => 'Idioma';

	/// es: 'Español'
	String get es => 'Español';

	/// es: 'English'
	String get en => 'English';
}

// Path: welcome.analytics
class Translations$welcome$analytics$es {
	Translations$welcome$analytics$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: '¿Nos ayudas a mejorar la app compartiendo datos de uso anónimos?'
	String get question => '¿Nos ayudas a mejorar la app compartiendo datos de uso anónimos?';

	/// es: 'Sí, compartir'
	String get yes => 'Sí, compartir';

	/// es: 'No, gracias'
	String get no => 'No, gracias';
}

// Path: screens.signIn
class Translations$screens$signIn$es {
	Translations$screens$signIn$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Iniciar sesión'
	String get title => 'Iniciar sesión';
}

// Path: screens.invite
class Translations$screens$invite$es {
	Translations$screens$invite$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Invitación'
	String get title => 'Invitación';
}

// Path: screens.code
class Translations$screens$code$es {
	Translations$screens$code$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Código'
	String get title => 'Código';
}

// Path: screens.bondNew
class Translations$screens$bondNew$es {
	Translations$screens$bondNew$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Nuevo vínculo'
	String get title => 'Nuevo vínculo';
}

// Path: screens.bond
class Translations$screens$bond$es {
	Translations$screens$bond$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Vínculo'
	String get title => 'Vínculo';
}

// Path: screens.bondAsk
class Translations$screens$bondAsk$es {
	Translations$screens$bondAsk$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Preguntar'
	String get title => 'Preguntar';
}

// Path: screens.bondAskVariations
class Translations$screens$bondAskVariations$es {
	Translations$screens$bondAskVariations$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Variaciones'
	String get title => 'Variaciones';
}

// Path: screens.bondTell
class Translations$screens$bondTell$es {
	Translations$screens$bondTell$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Contar'
	String get title => 'Contar';
}

// Path: screens.bondAskDetail
class Translations$screens$bondAskDetail$es {
	Translations$screens$bondAskDetail$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Pregunta'
	String get title => 'Pregunta';
}

// Path: screens.bondStory
class Translations$screens$bondStory$es {
	Translations$screens$bondStory$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Historia'
	String get title => 'Historia';
}

// Path: screens.bondCheckpoint
class Translations$screens$bondCheckpoint$es {
	Translations$screens$bondCheckpoint$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Punto de control'
	String get title => 'Punto de control';
}

// Path: screens.bondSettings
class Translations$screens$bondSettings$es {
	Translations$screens$bondSettings$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ajustes del vínculo'
	String get title => 'Ajustes del vínculo';
}

// Path: screens.family
class Translations$screens$family$es {
	Translations$screens$family$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Familia'
	String get title => 'Familia';
}

// Path: screens.familyMinorNew
class Translations$screens$familyMinorNew$es {
	Translations$screens$familyMinorNew$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Nuevo perfil de menor'
	String get title => 'Nuevo perfil de menor';
}

// Path: screens.familyMinorCode
class Translations$screens$familyMinorCode$es {
	Translations$screens$familyMinorCode$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Código del menor'
	String get title => 'Código del menor';
}

// Path: screens.deleteAccount
class Translations$screens$deleteAccount$es {
	Translations$screens$deleteAccount$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Eliminar cuenta'
	String get title => 'Eliminar cuenta';
}

// Path: screens.betaSubscription
class Translations$screens$betaSubscription$es {
	Translations$screens$betaSubscription$es.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Suscripción'
	String get title => 'Suscripción';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'tabs.garden' => 'Jardín',
			'tabs.questions' => 'Preguntas',
			'tabs.stories' => 'Historias',
			'tabs.settings' => 'Ajustes',
			'placeholder.body' => 'Pantalla en construcción',
			'errors.notFound' => 'Esta pantalla no existe',
			'errors.network' => 'No hay conexión. Lo intentaremos de nuevo.',
			'errors.generic' => 'Algo salió mal. Intenta de nuevo.',
			'profileUnavailable.title' => 'No pudimos cargar tu perfil',
			'profileUnavailable.retry' => 'Reintentar',
			'profileUnavailable.signOut' => 'Cerrar sesión',
			'welcome.title' => 'Historias que nos unen',
			'welcome.subtitle' => 'Pregúntale a tu familia lo que siempre quisiste saber. Y recuerda lo que ya contaste.',
			'welcome.language.label' => 'Idioma',
			'welcome.language.es' => 'Español',
			'welcome.language.en' => 'English',
			'welcome.analytics.question' => '¿Nos ayudas a mejorar la app compartiendo datos de uso anónimos?',
			'welcome.analytics.yes' => 'Sí, compartir',
			'welcome.analytics.no' => 'No, gracias',
			'welcome.start' => 'Empezar',
			'signIn.google' => 'Continuar con Google',
			'signIn.apple' => 'Continuar con Apple',
			'signIn.haveCode' => 'Tengo un código',
			'age.title' => '¿En qué año naciste?',
			'age.yearLabel' => 'Año de nacimiento',
			'age.nameLabel' => '¿Cómo te llamas?',
			'age.confirm' => 'Continuar',
			'age.blocked' => 'Para usar la app, pídele a tu madre, padre o tutor que te cree un perfil desde su teléfono.',
			'age.cardLanguageTitle' => '¿En qué idioma quieres ver las preguntas?',
			'age.cardLanguageEnglish' => 'Solo en inglés',
			'age.cardLanguageSpanish' => 'Solo en español',
			'age.cardLanguageBilingual' => 'En los dos idiomas',
			'age.primaryLanguageTitle' => '¿Cuál se muestra primero, en grande?',
			'age.primaryLanguageEnglish' => 'Inglés',
			'age.primaryLanguageSpanish' => 'Español',
			'createFamily.title' => 'Ponle nombre a tu familia',
			'createFamily.subtitle' => 'Es el espacio que van a compartir. Puedes cambiarlo después.',
			'createFamily.nameLabel' => 'Nombre de la familia',
			'createFamily.nameHint' => 'Familia García',
			'createFamily.confirm' => 'Crear',
			'screens.signIn.title' => 'Iniciar sesión',
			'screens.invite.title' => 'Invitación',
			'screens.code.title' => 'Código',
			'screens.bondNew.title' => 'Nuevo vínculo',
			'screens.bond.title' => 'Vínculo',
			'screens.bondAsk.title' => 'Preguntar',
			'screens.bondAskVariations.title' => 'Variaciones',
			'screens.bondTell.title' => 'Contar',
			'screens.bondAskDetail.title' => 'Pregunta',
			'screens.bondStory.title' => 'Historia',
			'screens.bondCheckpoint.title' => 'Punto de control',
			'screens.bondSettings.title' => 'Ajustes del vínculo',
			'screens.family.title' => 'Familia',
			'screens.familyMinorNew.title' => 'Nuevo perfil de menor',
			'screens.familyMinorCode.title' => 'Código del menor',
			'screens.deleteAccount.title' => 'Eliminar cuenta',
			'screens.betaSubscription.title' => 'Suscripción',
			_ => null,
		};
	}
}
