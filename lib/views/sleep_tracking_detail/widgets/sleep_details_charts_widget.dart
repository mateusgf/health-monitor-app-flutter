import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_chart_widget.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_stage_widget.dart';
import 'package:health_monitor_app_flutter/models/sleep_detail_raw.model.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';

class SleepDetailsChartsWidget extends StatelessWidget {
  final List<SleepDetailRaw> sleepPhases;
  final int sleepTime;
  final int sleepStartTime;
  final int sleepEndTime;

  const SleepDetailsChartsWidget({
    Key? key,
    required this.sleepPhases,
    required this.sleepTime,
    required this.sleepStartTime,
    required this.sleepEndTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getSleepLabel = (int phase) {
      switch (phase) {
        case AWAKE_INDEX:
          return t.sleep.awake;
        case REM_INDEX:
          return t.sleep.rem;
        case LIGHT_SLEEP_INDEX:
          return t.sleep.light;
        case DEEP_SLEEP_INDEX:
          return t.sleep.deep;
        default:
          return 'Unknown';
      }
    };

    final List<Map<String, int>> formattedPhases = sleepPhases
        .map((item) => {'phase': item.phase, 'duration': item.duration})
        .toList();

    // Calculate sleep stages sum
    final Map<int, int> sleepStagesSum = {};
    for (var sleepItem in formattedPhases) {
      final phase = sleepItem['phase']!;
      final duration = sleepItem['duration']!;
      sleepStagesSum[phase] = (sleepStagesSum[phase] ?? 0) + duration;
    }

    final List<Map<String, dynamic>> sleepStages = sleepStagesSum.entries
        .map((entry) => {'phase': entry.key, 'total': entry.value})
        .toList();

    // Calculate raw percentages and round them
    int totalPercentage = 0;
    final List<Map<String, dynamic>> roundedPercentages =
        sleepStages.map((stage) {
      final double rawPercentage = (stage['total'] * 100) / sleepTime;
      final int roundedPercentage = rawPercentage.round();
      totalPercentage += roundedPercentage;
      return {...stage, 'percentage': roundedPercentage};
    }).toList();

    // Adjust percentages to ensure the total equals 100%
    final int difference = 100 - totalPercentage;
    if (difference != 0) {
      // Find the stage with the largest percentage and adjust it
      final maxStage = roundedPercentages.reduce((max, stage) =>
          stage['percentage'] > max['percentage'] ? stage : max);

      maxStage['percentage'] += difference;
    }

    final List<Map<String, dynamic>> sleepStagesWithLabel = roundedPercentages
        .map((entry) => {
              ...entry,
              'label': getSleepLabel(entry['phase']),
            })
        .toList();

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 2,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SleepChartWidget(
                  sleepPhases: formattedPhases,
                  sleepTime: sleepTime,
                  sleepStartTime: sleepStartTime,
                  sleepEndTime: sleepEndTime,
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: SleepStageWidget(
                containerWidthPercentage: 0.5,
                sleepStages: sleepStagesWithLabel,
              ),
            ),
          ],
        )
      ],
    );
  }
}
