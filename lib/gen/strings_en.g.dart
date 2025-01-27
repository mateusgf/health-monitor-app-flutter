///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsSleepHistoryEn sleep_history = TranslationsSleepHistoryEn._(_root);
	late final TranslationsSleepEn sleep = TranslationsSleepEn._(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

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
class TranslationsSleepHistoryEn {
	TranslationsSleepHistoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get screen_title => 'Sleep History';
	String get no_data => 'No data available';
	String get sleep_score => 'Sleep Score';
	String get duration_in_minutes => 'Duration in minutes';
}

// Path: sleep
class TranslationsSleepEn {
	TranslationsSleepEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get screen_title => 'Sleep Data Details';
	String get light => 'Light Sleep';
	String get awake => 'Awake';
	String get deep => 'Deep Sleep';
	String get rem => 'REM';
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

