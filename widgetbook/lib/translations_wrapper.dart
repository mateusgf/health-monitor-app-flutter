import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TranslationsWrapper extends StatelessWidget {
  final Widget child;
  final String lang;

  const TranslationsWrapper(
      {super.key, required this.child, required this.lang});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(lang),
      supportedLocales: [
        Locale('en'),
        Locale('pt'),
      ],
      home: child,
    );
  }
}
