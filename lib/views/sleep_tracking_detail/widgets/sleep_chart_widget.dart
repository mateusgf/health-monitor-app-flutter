import 'package:flutter/material.dart';
import 'package:chart_view/chart_view.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';

class SleepChartWidget extends StatelessWidget {
  final List<Map<String, int>> sleepPhases;
  final int sleepTime;
  final int sleepStartTime;
  final int sleepEndTime;

  const SleepChartWidget({
    Key? key,
    required this.sleepPhases,
    required this.sleepTime,
    required this.sleepStartTime,
    required this.sleepEndTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SleepModel> lists = [];
    {
      SleepModel one = SleepModel(AWAKE_COLOR, []);
      one.descr = t.sleep.awake;
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(REM_COLOR, []);
      one.descr = t.sleep.rem;
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(LIGHT_SLEEP_COLOR, []);
      one.descr = t.sleep.light;
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(DEEP_SLEEP_COLOR, []);
      one.descr = t.sleep.deep;
      lists.add(one);
    }

    SleepModel? beforeModel;

    int currentTime = 0;
    for (var phase in sleepPhases) {
      int index = phase['phase']!;
      int duration = phase['duration']!;
      SleepModel nowModel = lists[index];

      if (beforeModel != nowModel) {
        if (beforeModel != null) {
          Range values = beforeModel.lists.last;
          values.end = currentTime;
        }
        Range values = Range(currentTime, currentTime + duration);
        nowModel.lists.add(values);
      } else {
        if (beforeModel != null) {
          Range values = beforeModel.lists.last;
          values.end = currentTime + duration;
        }
      }

      currentTime += duration;
      beforeModel = nowModel;
    }

    // Finalize the last phase
    if (beforeModel != null) {
      Range values = beforeModel.lists.last;
      values.end = sleepTime;
    }

    return Expanded(child: SleepWidget(lists, sleepStartTime, sleepEndTime));
  }
}
