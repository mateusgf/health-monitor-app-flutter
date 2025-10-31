import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/models/app_theme.dart';

class SleepStageBarsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> sleepStages;
  final int sleepTime;
  final SleepThemeColors themeColors;

  const SleepStageBarsWidget({
    Key? key,
    required this.sleepStages,
    required this.sleepTime,
    required this.themeColors,
  }) : super(key: key);

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '$hours:${mins.toString().padLeft(2, '0')}';
  }

  Color _getPhaseColor(int phase) {
    switch (phase) {
      case AWAKE_INDEX:
        return AWAKE_SLEEP_COLOR;
      case LIGHT_SLEEP_INDEX:
        return LIGHT_SLEEP_COLOR;
      case DEEP_SLEEP_INDEX:
        return DEEP_SLEEP_COLOR;
      case REM_INDEX:
        return REM_SLEEP_COLOR;
      default:
        return DEFAULT_SLEEP_NO_COLOR;
    }
  }

  String _getPhaseLabel(int phase) {
    switch (phase) {
      case AWAKE_INDEX:
        return 'AWAKE';
      case LIGHT_SLEEP_INDEX:
        return 'LIGHT';
      case DEEP_SLEEP_INDEX:
        return 'SWS (DEEP)';
      case REM_INDEX:
        return 'REM';
      default:
        return 'UNKNOWN';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 12,
                    decoration: BoxDecoration(
                      color: themeColors.typicalRangeMarker,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'TYPICAL RANGE',
                    style: TextStyle(
                      color: themeColors.tertiaryText,
                      fontSize: 11,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                'DURATION 9:07',
                style: TextStyle(
                  color: themeColors.tertiaryText,
                  fontSize: 11,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...sleepStages.map((stage) => _buildStageBar(stage)).toList(),
        ],
      ),
    );
  }

  Widget _buildStageBar(Map<String, dynamic> stage) {
    final phase = stage['phase'] as int;
    final percentage = stage['percentage'] as int;
    final total = stage['total'] as int;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    _getPhaseLabel(phase),
                    style: TextStyle(
                      color: themeColors.primaryText,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$percentage%',
                    style: TextStyle(
                      color: _getPhaseColor(phase),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                _formatDuration(total),
                style: TextStyle(
                  color: themeColors.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: themeColors.diagonalStripes.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomPaint(
                  painter: DiagonalStripesPainter(themeColors: themeColors),
                  child: Container(),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage / 100,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: _getPhaseColor(phase),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 3,
                          decoration: BoxDecoration(
                            color: themeColors.typicalRangeMarker,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiagonalStripesPainter extends CustomPainter {
  final SleepThemeColors themeColors;

  DiagonalStripesPainter({required this.themeColors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = themeColors.diagonalStripes
      ..strokeWidth = 1.5;

    for (var i = -size.height; i < size.width; i += 8) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
