import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_details_charts_widget.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';

class SleepTrackingDetailScreen extends ConsumerWidget {
  const SleepTrackingDetailScreen({super.key, String? id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int id = 1;
    final sleepPhasesAsyncValue = ref.watch(sleepDetailRawProvider(id));

    final int sleepTime = 7 * 60; // 7 hours
    final sleepStartTime = 23 * 60; // Started to sleep at 23:00
    final sleepEndTime = 6 * 60; // Woke up at 6:00

    return Scaffold(
      appBar: AppBar(title: Text(t.sleep.screen_title)),
      body: sleepPhasesAsyncValue.when(
        data: (sleepPhases) => SleepDetailsChartsWidget(
          sleepPhases: sleepPhases,
          sleepTime: sleepTime,
          sleepStartTime: sleepStartTime,
          sleepEndTime: sleepEndTime,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}
