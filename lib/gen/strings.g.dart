/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 60 (20 per locale)
///
/// Built on 2025-01-25 at 08:07 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	es(languageCode: 'es', build: _StringsEs.build),
	pt(languageCode: 'pt', build: _StringsPt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get appName => 'health_monitor_app_flutter';
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	late final _StringsSubscriptionsEn subscriptions = _StringsSubscriptionsEn._(_root);
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsErrorsEmailEn email = _StringsErrorsEmailEn._(_root);
	late final _StringsErrorsPasswordEn password = _StringsErrorsPasswordEn._(_root);
}

// Path: subscriptions
class _StringsSubscriptionsEn {
	_StringsSubscriptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSubscriptionsDurationEn duration = _StringsSubscriptionsDurationEn._(_root);
	late final _StringsSubscriptionsPeriodunitEn periodunit = _StringsSubscriptionsPeriodunitEn._(_root);
}

// Path: errors.email
class _StringsErrorsEmailEn {
	_StringsErrorsEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'We need your email address';
	String get invalid => 'It looks like your email address is not valid';
}

// Path: errors.password
class _StringsErrorsPasswordEn {
	_StringsErrorsPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'We need your password';
	String get invalid => 'Your password must be at least 6 characters long';
}

// Path: subscriptions.duration
class _StringsSubscriptionsDurationEn {
	_StringsSubscriptionsDurationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get lifetime => 'Lifetime';
	String get annual => 'Every year';
	String get sixMonth => 'Every 6 months';
	String get threeMonth => 'Every 3 months';
	String get twoMonth => 'Every 2 months';
	String get monthly => 'Every month';
	String get weekly => 'Every week';
}

// Path: subscriptions.periodunit
class _StringsSubscriptionsPeriodunitEn {
	_StringsSubscriptionsPeriodunitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Day',
		other: 'Days',
	);
	String week({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Week',
		other: 'Weeks',
	);
	String month({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Month',
		other: 'Months',
	);
	String year({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Year',
		other: 'Years',
	);
}

// Path: <root>
class _StringsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get appName => 'health_monitor_app_flutter';
	@override late final _StringsErrorsEs errors = _StringsErrorsEs._(_root);
	@override late final _StringsSubscriptionsEs subscriptions = _StringsSubscriptionsEs._(_root);
}

// Path: errors
class _StringsErrorsEs implements _StringsErrorsEn {
	_StringsErrorsEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsErrorsEmailEs email = _StringsErrorsEmailEs._(_root);
	@override late final _StringsErrorsPasswordEs password = _StringsErrorsPasswordEs._(_root);
}

// Path: subscriptions
class _StringsSubscriptionsEs implements _StringsSubscriptionsEn {
	_StringsSubscriptionsEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsSubscriptionsDurationEs duration = _StringsSubscriptionsDurationEs._(_root);
	@override late final _StringsSubscriptionsPeriodunitEs periodunit = _StringsSubscriptionsPeriodunitEs._(_root);
}

// Path: errors.email
class _StringsErrorsEmailEs implements _StringsErrorsEmailEn {
	_StringsErrorsEmailEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Necesitamos tu dirección de correo electrónico';
	@override String get invalid => 'Parece que tu dirección de correo electrónico no es válida';
}

// Path: errors.password
class _StringsErrorsPasswordEs implements _StringsErrorsPasswordEn {
	_StringsErrorsPasswordEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Necesitamos una contraseña segura';
	@override String get invalid => 'Su contraseña debe contener al menos 6 caracteres.';
}

// Path: subscriptions.duration
class _StringsSubscriptionsDurationEs implements _StringsSubscriptionsDurationEn {
	_StringsSubscriptionsDurationEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get lifetime => 'Vida';
	@override String get annual => 'Anual';
	@override String get sixMonth => 'Semestral';
	@override String get threeMonth => 'Trimestral';
	@override String get twoMonth => 'Cada 2 meses';
	@override String get monthly => 'Mensual';
	@override String get weekly => 'Semanalmente';
}

// Path: subscriptions.periodunit
class _StringsSubscriptionsPeriodunitEs implements _StringsSubscriptionsPeriodunitEn {
	_StringsSubscriptionsPeriodunitEs._(this._root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'Día',
		other: 'Días',
	);
	@override String week({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'Semana',
		other: 'Semanas',
	);
	@override String month({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'Mes',
		other: 'Meses',
	);
	@override String year({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: 'Año',
		other: 'Años',
	);
}

// Path: <root>
class _StringsPt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsPt _root = this; // ignore: unused_field

	// Translations
	@override String get appName => 'health_monitor_app_flutter';
	@override late final _StringsErrorsPt errors = _StringsErrorsPt._(_root);
	@override late final _StringsSubscriptionsPt subscriptions = _StringsSubscriptionsPt._(_root);
}

// Path: errors
class _StringsErrorsPt implements _StringsErrorsEn {
	_StringsErrorsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsErrorsEmailPt email = _StringsErrorsEmailPt._(_root);
	@override late final _StringsErrorsPasswordPt password = _StringsErrorsPasswordPt._(_root);
}

// Path: subscriptions
class _StringsSubscriptionsPt implements _StringsSubscriptionsEn {
	_StringsSubscriptionsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsSubscriptionsDurationPt duration = _StringsSubscriptionsDurationPt._(_root);
	@override late final _StringsSubscriptionsPeriodunitPt periodunit = _StringsSubscriptionsPeriodunitPt._(_root);
}

// Path: errors.email
class _StringsErrorsEmailPt implements _StringsErrorsEmailEn {
	_StringsErrorsEmailPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Precisamos do seu endereço de e-mail';
	@override String get invalid => 'Parece que seu endereço de e-mail é inválido';
}

// Path: errors.password
class _StringsErrorsPasswordPt implements _StringsErrorsPasswordEn {
	_StringsErrorsPasswordPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Precisamos de uma senha forte';
	@override String get invalid => 'Sua senha precisa conter pelo menos 6 caracteres';
}

// Path: subscriptions.duration
class _StringsSubscriptionsDurationPt implements _StringsSubscriptionsDurationEn {
	_StringsSubscriptionsDurationPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get lifetime => 'Vitalício';
	@override String get annual => 'Anual';
	@override String get sixMonth => 'Semestral';
	@override String get threeMonth => 'Trimestral';
	@override String get twoMonth => 'A cada 2 meses';
	@override String get monthly => 'Mensual';
	@override String get weekly => 'Semanalmente';
}

// Path: subscriptions.periodunit
class _StringsSubscriptionsPeriodunitPt implements _StringsSubscriptionsPeriodunitEn {
	_StringsSubscriptionsPeriodunitPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Dia',
		other: 'Dias',
	);
	@override String week({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Semana',
		other: 'Semanas',
	);
	@override String month({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Mês',
		other: 'Meses',
	);
	@override String year({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Ano',
		other: 'Anos',
	);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'health_monitor_app_flutter';
			case 'errors.email.empty': return 'We need your email address';
			case 'errors.email.invalid': return 'It looks like your email address is not valid';
			case 'errors.password.empty': return 'We need your password';
			case 'errors.password.invalid': return 'Your password must be at least 6 characters long';
			case 'subscriptions.duration.lifetime': return 'Lifetime';
			case 'subscriptions.duration.annual': return 'Every year';
			case 'subscriptions.duration.sixMonth': return 'Every 6 months';
			case 'subscriptions.duration.threeMonth': return 'Every 3 months';
			case 'subscriptions.duration.twoMonth': return 'Every 2 months';
			case 'subscriptions.duration.monthly': return 'Every month';
			case 'subscriptions.duration.weekly': return 'Every week';
			case 'subscriptions.periodunit.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Day',
				other: 'Days',
			);
			case 'subscriptions.periodunit.week': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Week',
				other: 'Weeks',
			);
			case 'subscriptions.periodunit.month': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Month',
				other: 'Months',
			);
			case 'subscriptions.periodunit.year': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Year',
				other: 'Years',
			);
			default: return null;
		}
	}
}

extension on _StringsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'health_monitor_app_flutter';
			case 'errors.email.empty': return 'Necesitamos tu dirección de correo electrónico';
			case 'errors.email.invalid': return 'Parece que tu dirección de correo electrónico no es válida';
			case 'errors.password.empty': return 'Necesitamos una contraseña segura';
			case 'errors.password.invalid': return 'Su contraseña debe contener al menos 6 caracteres.';
			case 'subscriptions.duration.lifetime': return 'Vida';
			case 'subscriptions.duration.annual': return 'Anual';
			case 'subscriptions.duration.sixMonth': return 'Semestral';
			case 'subscriptions.duration.threeMonth': return 'Trimestral';
			case 'subscriptions.duration.twoMonth': return 'Cada 2 meses';
			case 'subscriptions.duration.monthly': return 'Mensual';
			case 'subscriptions.duration.weekly': return 'Semanalmente';
			case 'subscriptions.periodunit.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
				one: 'Día',
				other: 'Días',
			);
			case 'subscriptions.periodunit.week': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
				one: 'Semana',
				other: 'Semanas',
			);
			case 'subscriptions.periodunit.month': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
				one: 'Mes',
				other: 'Meses',
			);
			case 'subscriptions.periodunit.year': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
				one: 'Año',
				other: 'Años',
			);
			default: return null;
		}
	}
}

extension on _StringsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'health_monitor_app_flutter';
			case 'errors.email.empty': return 'Precisamos do seu endereço de e-mail';
			case 'errors.email.invalid': return 'Parece que seu endereço de e-mail é inválido';
			case 'errors.password.empty': return 'Precisamos de uma senha forte';
			case 'errors.password.invalid': return 'Sua senha precisa conter pelo menos 6 caracteres';
			case 'subscriptions.duration.lifetime': return 'Vitalício';
			case 'subscriptions.duration.annual': return 'Anual';
			case 'subscriptions.duration.sixMonth': return 'Semestral';
			case 'subscriptions.duration.threeMonth': return 'Trimestral';
			case 'subscriptions.duration.twoMonth': return 'A cada 2 meses';
			case 'subscriptions.duration.monthly': return 'Mensual';
			case 'subscriptions.duration.weekly': return 'Semanalmente';
			case 'subscriptions.periodunit.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Dia',
				other: 'Dias',
			);
			case 'subscriptions.periodunit.week': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Semana',
				other: 'Semanas',
			);
			case 'subscriptions.periodunit.month': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Mês',
				other: 'Meses',
			);
			case 'subscriptions.periodunit.year': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Ano',
				other: 'Anos',
			);
			default: return null;
		}
	}
}
