import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:health_monitor_app_flutter/views/splash/splash.screen.dart';

@widgetbook.UseCase(name: 'Default', type: SplashScreen)
Widget buildSplashScreenUseCase(BuildContext context) {
  return SplashScreen();
}
