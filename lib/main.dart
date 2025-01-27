import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/logger.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  logger.i('Starting main...');

  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  logger.i('Starting app...');

  var app = TranslationProvider(
    child: const ProviderScope(
      child: MyApp(),
    ),
  );

  // @TODO remove hardcoded locale
  LocaleSettings.setLocaleRaw('pt');

  await dotenv.load(fileName: ".env.dev");

  runApp(app);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('flutterLocale ${TranslationProvider.of(context).flutterLocale}');
    print('AppLocaleUtils.supportedLocales ${AppLocaleUtils.supportedLocales}');

    return MaterialApp.router(
      // This is the main language of the phone itself and not the app (Even if locale is forced/hardcoded at startup).
      locale: TranslationProvider.of(context).flutterLocale,

      // @TODO: remove hardcoded locale and let the app use the phone's locale
      // locale: Locale('pt'),

      // AppLocaleUtils.supportedLocales comes from the languages from the phone itself and not from the app.
      // So it's better to use the supportedLocales from the app itself.
      // supportedLocales: AppLocaleUtils.supportedLocales,
      supportedLocales: [
        Locale('en'),
        Locale('pt'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(useMaterial3: true),
      routerConfig: ref.read(routerProvider),
    );
  }
}
