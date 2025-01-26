import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/logger.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  logger.i('Starting main...');

  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  logger.i('Starting app...');

  var app = TranslationProvider(
    child: const ProviderScope(
      child: MyApp(),
    ),
  );

  // @TODO: remove hardcoded/forced locale
  LocaleSettings.setLocaleRaw('br');

  runApp(app);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('flutterLocale ${TranslationProvider.of(context).flutterLocale}');
    print('AppLocaleUtils.supportedLocales ${AppLocaleUtils.supportedLocales}');

    return MaterialApp.router(
      // this is the main language of the phone itself and not the app. Even though the locale here in the app is hardcoded for debugging purposes, this value here still comes from the phone
      locale: TranslationProvider.of(context).flutterLocale,
      // This comes from the languages to the phone itself and not the app
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(useMaterial3: true),
      routerConfig: ref.read(routerProvider),
    );
  }
}
