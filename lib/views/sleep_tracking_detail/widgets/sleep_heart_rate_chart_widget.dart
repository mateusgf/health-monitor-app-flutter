import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/models/app_theme.dart';
import 'dart:math' as math;

class SleepHeartRateChartWidget extends StatelessWidget {
  final int sleepStartTime;
  final int sleepEndTime;
  final SleepThemeColors themeColors;

  const SleepHeartRateChartWidget({
    Key? key,
    required this.sleepStartTime,
    required this.sleepEndTime,
    required this.themeColors,
  }) : super(key: key);

  String _formatTime(int minutes) {
    final hour = (minutes ~/ 60) % 24;
    final minute = minutes % 60;
    final period = hour >= 12 ? 'AM' : 'PM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              painter: HeartRateChartPainter(themeColors: themeColors),
              child: Container(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatTime(sleepStartTime),
                style: TextStyle(
                  color: themeColors.secondaryText,
                  fontSize: 12,
                ),
              ),
              Text(
                _formatTime(sleepEndTime),
                style: TextStyle(
                  color: themeColors.secondaryText,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeartRateChartPainter extends CustomPainter {
  final SleepThemeColors themeColors;

  HeartRateChartPainter({required this.themeColors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = themeColors.chartLine
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    final random = math.Random(42);

    for (var i = 0; i < 100; i++) {
      final x = (i / 100) * size.width;
      final baseY = size.height * 0.6;
      final variance = size.height * 0.3;
      final y = baseY - (random.nextDouble() * variance);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final labels = ['90', '70', '50', '30'];
    for (var i = 0; i < labels.length; i++) {
      textPainter.text = TextSpan(
        text: labels[i],
        style: TextStyle(
          color: themeColors.tertiaryText,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(0, (i / 3) * size.height - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
