import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/models/sleep_detail_raw.model.dart';
import 'package:health_monitor_app_flutter/models/app_theme.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_chart_widget.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_details_charts_widget.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_heart_rate_chart_widget.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_stage_bars_widget.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_metrics_widget.dart';

class SleepDetailContentWidget extends StatelessWidget {
  final List<SleepDetailRaw> sleepPhases;
  final int sleepTime;
  final int sleepStartTime;
  final int sleepEndTime;
  final SleepThemeColors themeColors;

  const SleepDetailContentWidget({
    Key? key,
    required this.sleepPhases,
    required this.sleepTime,
    required this.sleepStartTime,
    required this.sleepEndTime,
    required this.themeColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, int>> formattedPhases = sleepPhases
        .map((item) => {'phase': item.phase, 'duration': item.duration})
        .toList();

    final Map<int, int> sleepStagesSum = {};
    for (var sleepItem in formattedPhases) {
      final phase = sleepItem['phase']!;
      final duration = sleepItem['duration']!;
      sleepStagesSum[phase] = (sleepStagesSum[phase] ?? 0) + duration;
    }

    final List<Map<String, dynamic>> sleepStages = sleepStagesSum.entries
        .map((entry) => {'phase': entry.key, 'total': entry.value})
        .toList();

    int totalPercentage = 0;
    final List<Map<String, dynamic>> roundedPercentages =
        sleepStages.map((stage) {
      final double rawPercentage = (stage['total'] * 100) / sleepTime;
      final int roundedPercentage = rawPercentage.round();
      totalPercentage += roundedPercentage;
      return {...stage, 'percentage': roundedPercentage};
    }).toList();

    final int difference = 100 - totalPercentage;
    if (difference != 0) {
      final maxStage = roundedPercentages.reduce(
        (max, stage) => stage['percentage'] > max['percentage'] ? stage : max,
      );
      maxStage['percentage'] += difference;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '8:25',
                          style: TextStyle(
                            color: themeColors.accentBlue,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                  color: Colors.green[400], size: 14),
                              Text(
                                '7:55',
                                style: TextStyle(
                                  color: themeColors.secondaryText,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'HOURS OF SLEEP',
                      style: TextStyle(
                        color: themeColors.tertiaryText,
                        fontSize: 11,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '4:38',
                          style: TextStyle(
                            color: themeColors.primaryText,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                  color: Colors.green[400], size: 14),
                              Text(
                                '3:37',
                                style: TextStyle(
                                  color: themeColors.secondaryText,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'RESTORATIVE SLEEP',
                      style: TextStyle(
                        color: themeColors.tertiaryText,
                        fontSize: 11,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '30% of your time in bed was spent in REM sleep. This might indicate your body is making up for not getting enough REM sleep recently.',
              style: TextStyle(
                color: themeColors.secondaryText,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SleepHeartRateChartWidget(
            sleepStartTime: sleepStartTime,
            sleepEndTime: sleepEndTime,
            themeColors: themeColors,
          ),
          const SizedBox(height: 30),
          SleepDetailsChartsWidget(
            sleepPhases: sleepPhases,
            sleepTime: sleepTime,
            sleepStartTime: sleepStartTime,
            sleepEndTime: sleepEndTime,
            // themeColors: themeColors,
          ),
          const SizedBox(height: 30),
          SleepStageBarsWidget(
            sleepStages: roundedPercentages,
            sleepTime: sleepTime,
            themeColors: themeColors,
          ),
          const SizedBox(height: 30),
          SleepMetricsWidget(themeColors: themeColors),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
