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

  runApp(app);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(useMaterial3: true),
      routerConfig: ref.read(routerProvider),
    );
  }
}
