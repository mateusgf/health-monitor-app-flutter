/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 32 (16 per locale)
///
/// Built on 2025-01-26 at 18:30 UTC

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
	br(languageCode: 'br', build: _StringsBr.build);

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
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsSleepHistoryEn sleep_history = _StringsSleepHistoryEn._(_root);
	late final _StringsSleepEn sleep = _StringsSleepEn._(_root);
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get screen_title => 'Health Track for Wearables';
	String get sleep_data => 'Sleep data';
	String get error_platform_not_supported => 'Platform not supported';
	String get set_up_new_device => 'Setup a new bluetooth device';
	String get daily_steps => 'Daily Steps';
	String get calories => 'Calories';
	String get distance => 'Distance';
}

// Path: sleep_history
class _StringsSleepHistoryEn {
	_StringsSleepHistoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get screen_title => 'Sleep History';
	String get no_data => 'No data available';
	String get sleep_score => 'Sleep Score';
	String get duration_in_minutes => 'Duration in minutes';
}

// Path: sleep
class _StringsSleepEn {
	_StringsSleepEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get screen_title => 'Sleep Data Details';
	String get light => 'Light Sleep';
	String get awake => 'Awake';
	String get deep => 'Deep Sleep';
	String get rem => 'REM';
}

// Path: <root>
class _StringsBr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsBr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.br,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <br>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsBr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeBr home = _StringsHomeBr._(_root);
	@override late final _StringsSleepHistoryBr sleep_history = _StringsSleepHistoryBr._(_root);
	@override late final _StringsSleepBr sleep = _StringsSleepBr._(_root);
}

// Path: home
class _StringsHomeBr implements _StringsHomeEn {
	_StringsHomeBr._(this._root);

	@override final _StringsBr _root; // ignore: unused_field

	// Translations
	@override String get screen_title => 'Monitor de Saúde';
	@override String get sleep_data => 'Dados de Sono';
	@override String get error_platform_not_supported => 'Plataforma não suportada';
	@override String get set_up_new_device => 'Configurar novo dispositivo bluetooth';
	@override String get daily_steps => 'Passos Diários';
	@override String get calories => 'Calorias';
	@override String get distance => 'Distância';
}

// Path: sleep_history
class _StringsSleepHistoryBr implements _StringsSleepHistoryEn {
	_StringsSleepHistoryBr._(this._root);

	@override final _StringsBr _root; // ignore: unused_field

	// Translations
	@override String get screen_title => 'Histórico de Sono';
	@override String get no_data => 'Nenhum dado disponível';
	@override String get sleep_score => 'Pontuação do Sono';
	@override String get duration_in_minutes => 'Duração em minutos';
}

// Path: sleep
class _StringsSleepBr implements _StringsSleepEn {
	_StringsSleepBr._(this._root);

	@override final _StringsBr _root; // ignore: unused_field

	// Translations
	@override String get screen_title => 'Detalhes do sono';
	@override String get light => 'Sono Leve';
	@override String get awake => 'Acordado';
	@override String get deep => 'Sono profundo';
	@override String get rem => 'REM';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.screen_title': return 'Health Track for Wearables';
			case 'home.sleep_data': return 'Sleep data';
			case 'home.error_platform_not_supported': return 'Platform not supported';
			case 'home.set_up_new_device': return 'Setup a new bluetooth device';
			case 'home.daily_steps': return 'Daily Steps';
			case 'home.calories': return 'Calories';
			case 'home.distance': return 'Distance';
			case 'sleep_history.screen_title': return 'Sleep History';
			case 'sleep_history.no_data': return 'No data available';
			case 'sleep_history.sleep_score': return 'Sleep Score';
			case 'sleep_history.duration_in_minutes': return 'Duration in minutes';
			case 'sleep.screen_title': return 'Sleep Data Details';
			case 'sleep.light': return 'Light Sleep';
			case 'sleep.awake': return 'Awake';
			case 'sleep.deep': return 'Deep Sleep';
			case 'sleep.rem': return 'REM';
			default: return null;
		}
	}
}

extension on _StringsBr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.screen_title': return 'Monitor de Saúde';
			case 'home.sleep_data': return 'Dados de Sono';
			case 'home.error_platform_not_supported': return 'Plataforma não suportada';
			case 'home.set_up_new_device': return 'Configurar novo dispositivo bluetooth';
			case 'home.daily_steps': return 'Passos Diários';
			case 'home.calories': return 'Calorias';
			case 'home.distance': return 'Distância';
			case 'sleep_history.screen_title': return 'Histórico de Sono';
			case 'sleep_history.no_data': return 'Nenhum dado disponível';
			case 'sleep_history.sleep_score': return 'Pontuação do Sono';
			case 'sleep_history.duration_in_minutes': return 'Duração em minutos';
			case 'sleep.screen_title': return 'Detalhes do sono';
			case 'sleep.light': return 'Sono Leve';
			case 'sleep.awake': return 'Acordado';
			case 'sleep.deep': return 'Sono profundo';
			case 'sleep.rem': return 'REM';
			default: return null;
		}
	}
}
