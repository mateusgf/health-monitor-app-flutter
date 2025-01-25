import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/sleep_tracking_detail.screen.dart';

@widgetbook.UseCase(name: 'Default', type: SleepTrackingDetailScreen)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SleepTrackingDetailScreen();
}
