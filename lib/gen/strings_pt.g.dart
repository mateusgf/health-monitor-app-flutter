///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsPt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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

	late final TranslationsPt _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomePt home = _TranslationsHomePt._(_root);
	@override late final _TranslationsSleepHistoryPt sleep_history = _TranslationsSleepHistoryPt._(_root);
	@override late final _TranslationsSleepPt sleep = _TranslationsSleepPt._(_root);
}

// Path: home
class _TranslationsHomePt implements TranslationsHomeEn {
	_TranslationsHomePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSleepHistoryPt implements TranslationsSleepHistoryEn {
	_TranslationsSleepHistoryPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get screen_title => 'Histórico de Sono';
	@override String get no_data => 'Nenhum dado disponível';
	@override String get sleep_score => 'Pontuação do Sono';
	@override String get duration_in_minutes => 'Duração em minutos';
}

// Path: sleep
class _TranslationsSleepPt implements TranslationsSleepEn {
	_TranslationsSleepPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get screen_title => 'Detalhes do sono';
	@override String get light => 'Sono Leve';
	@override String get awake => 'Acordado';
	@override String get deep => 'Sono profundo';
	@override String get rem => 'REM';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsPt {
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

