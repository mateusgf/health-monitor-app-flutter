import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_stage_widget.dart';
import 'package:intl/intl.dart';
import 'package:chart_view/chart_view.dart';
import 'package:health_monitor_app_flutter/i18n/strings.g.dart';

class SleepTrackingDetailScreen extends ConsumerWidget {
  const SleepTrackingDetailScreen({super.key, String? id});

  Widget drawSleep(List<Map<String, int>> sleepPhases, int sleepTime,
      int sleepStartTime, int sleepEndTime) {
    List<SleepModel> lists = [];
    {
      SleepModel one = SleepModel(AWAKE_COLOR, []);
      one.descr = 'Awake';
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(REM_COLOR, []);
      one.descr = 'REM';
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(LIGHT_SLEEP_COLOR, []);
      one.descr = 'Light sleep';
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(DEEP_SLEEP_COLOR, []);
      one.descr = 'Deep Sleep';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int sleepTime = 7 * 60; // 7 hours
    final sleepStartTime = 23 * 60; // Started to sleep at 23:00
    final sleepEndTime = 6 * 60; // Woke up at 6:00

    // Hardcoded sleep phases. This will come processed from API.
    // Device will send raw data to mobile app and mobile app will send it to server for processing.
    // @TODO: get from API
    final List<Map<String, int>> sleepPhases = [
      {"phase": LIGHT_SLEEP_INDEX, "duration": 20},
      {"phase": AWAKE_INDEX, "duration": 5},
      {"phase": LIGHT_SLEEP_INDEX, "duration": 35},
      {"phase": DEEP_SLEEP_INDEX, "duration": 35},
      {"phase": LIGHT_SLEEP_INDEX, "duration": 25},
      {"phase": REM_INDEX, "duration": 60},
      {"phase": AWAKE_INDEX, "duration": 10},
      {"phase": LIGHT_SLEEP_INDEX, "duration": 110},
      {"phase": AWAKE_INDEX, "duration": 5},
      {"phase": DEEP_SLEEP_INDEX, "duration": 25},
      {"phase": LIGHT_SLEEP_INDEX, "duration": 90},
    ];

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

    // Calculate sleep stages sum
    final Map<int, int> sleepStagesSum = {};
    for (var sleepItem in sleepPhases) {
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

    return Scaffold(
      appBar: AppBar(title: Text(t.sleep.screen_title)),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 5 / 2,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  drawSleep(
                      sleepPhases, sleepTime, sleepStartTime, sleepEndTime),
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
      ),
    );
  }
}
