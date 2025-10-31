import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/models/app_theme.dart';

class SleepMetricsWidget extends StatelessWidget {
  final SleepThemeColors themeColors;

  const SleepMetricsWidget({Key? key, required this.themeColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SLEEP METRICS',
                style: TextStyle(
                  color: themeColors.secondaryText,
                  fontSize: 13,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'VS. 30 DAY RANGE',
                style: TextStyle(
                  color: themeColors.tertiaryText,
                  fontSize: 11,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              _buildMetricCard(
                icon: Icons.waving_hand_outlined,
                title: 'WAKE EVENTS',
                value: '1.3',
                unit: 'per hour',
                status: 'within 1.1-2.0 per hour',
                isGood: true,
              ),
              const SizedBox(width: 16),
              _buildMetricCard(
                icon: Icons.pie_chart_outline,
                title: 'EFFICIENCY',
                value: '92',
                unit: '%',
                status: 'within 91-95 %',
                isGood: true,
              ),
              const SizedBox(width: 16),
              _buildMetricCard(
                icon: Icons.air,
                title: 'RESPIR',
                value: '16.2',
                unit: '',
                status: 'within 15/',
                isGood: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String title,
    required String value,
    required String unit,
    required String status,
    required bool isGood,
  }) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: themeColors.cardBackground == Colors.white
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: themeColors.tertiaryText, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: themeColors.tertiaryText,
                  fontSize: 11,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: themeColors.primaryText,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    unit,
                    style: TextStyle(
                      color: themeColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green[400],
                size: 14,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 11,
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
