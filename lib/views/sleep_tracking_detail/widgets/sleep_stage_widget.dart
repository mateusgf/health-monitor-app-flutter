import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';

class SleepStageWidget extends StatelessWidget {
  final double containerWidthPercentage;
  final List<Map<String, dynamic>> sleepStages;

  const SleepStageWidget({
    Key? key,
    required this.containerWidthPercentage,
    required this.sleepStages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth =
        MediaQuery.of(context).size.width * containerWidthPercentage;

    var getSleepStageColor = (int stage) {
      switch (stage) {
        case AWAKE_INDEX:
          return AWAKE_COLOR;
        case REM_INDEX:
          return REM_COLOR;
        case LIGHT_SLEEP_INDEX:
          return LIGHT_SLEEP_COLOR;
        case DEEP_SLEEP_INDEX:
          return DEEP_SLEEP_COLOR;
        default:
          return Colors.white;
      }
    };

    return Center(
      child: Container(
        width: containerWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sleepStages.map((stage) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${stage['label']} ${stage['percentage']}%'),
                  SizedBox(height: 8),
                  Container(
                    color: getSleepStageColor(stage['phase']),
                    width: containerWidth * (stage['percentage'] / 100),
                    height: 20,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
