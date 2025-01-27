import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('DefaultWidgetsLocalizations: $DefaultWidgetsLocalizations');
    print('DefaultMaterialLocalizations: $DefaultMaterialLocalizations');

    return Widgetbook.material(
      directories: directories,
      addons: [
        LocalizationAddon(locales: [
          const Locale('en'),
          const Locale('pt'),
        ], localizationsDelegates: [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ], initialLocale: const Locale('en')),
        GridAddon(),
      ],
    );
  }
}
