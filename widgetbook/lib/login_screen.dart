import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:health_monitor_app_flutter/views/login/login.screen.dart';
import 'package:widgetbook_workspace/translations_wrapper.dart';

@widgetbook.UseCase(name: 'Default', type: LoginScreen)
Widget buildLoginScreenUseCase(BuildContext context) {
  return TranslationsWrapper(
    lang: 'en',
    child: LoginScreen(),
  );
}
