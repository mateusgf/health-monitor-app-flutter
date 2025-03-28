import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/logger.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_monitor_app_flutter/firebase_options.dart';
import 'package:health_monitor_app_flutter/services/error_handling_service.dart';

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

  await dotenv.load(fileName: '.env.dev');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(app);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.i('flutterLocale ${TranslationProvider.of(context).flutterLocale}');
    logger.i(
      'AppLocaleUtils.supportedLocales ${AppLocaleUtils.supportedLocales}',
    );

    return MaterialApp.router(
      scaffoldMessengerKey: ErrorHandlingService.scaffoldMessengerKey,
      // This is the main language of the phone itself and not the app (Even if locale is forced/hardcoded at startup).
      locale: TranslationProvider.of(context).flutterLocale,

      // @TODO: remove hardcoded locale and let the app use the phone's locale
      // locale: Locale('pt'),

      // AppLocaleUtils.supportedLocales comes from the languages from the phone itself and not from the app.
      // So it's better to use the supportedLocales from the app itself.
      // supportedLocales: AppLocaleUtils.supportedLocales,
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
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
