import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/models/daily_goal_chart_data.model.dart';
import 'package:health_monitor_app_flutter/models/daily_goal_data.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreenChart extends StatefulWidget {
  const HomeScreenChart({
    super.key,
    required this.dailyGoalData,
  });

  final DailyGoalData dailyGoalData;

  @override
  State<HomeScreenChart> createState() => _HomeScreenChartState();
}

class _HomeScreenChartState extends State<HomeScreenChart> {
  late final TooltipBehavior _tooltipBehavior;
  late final List<DailyGoalChartData> _chartData;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      format: 'point.x',
    );
    _initializeChartData();
  }

  void _initializeChartData() {
    final data = widget.dailyGoalData;
    _chartData = [
      DailyGoalChartData(
        x: '${t.home.distance} 43%\n${data.distance}/30 KM',
        y: 43,
        text: t.home.distance,
        pointColor: const Color.fromRGBO(63, 224, 0, 1.0),
      ),
      DailyGoalChartData(
        x: '${t.home.calories} 58%\n${data.calories}/2000 kcal',
        y: 58,
        text: t.home.calories,
        pointColor: const Color.fromARGB(255, 226, 125, 1),
      ),
      DailyGoalChartData(
        x: '${t.home.daily_steps} 65%\n${data.steps}/10000',
        y: 65,
        text: t.home.daily_steps,
        pointColor: const Color.fromRGBO(0, 201, 230, 1.0),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        iconHeight: 20,
        iconWidth: 20,
        overflowMode: LegendItemOverflowMode.wrap,
        isResponsive: true,
      ),
      tooltipBehavior: _tooltipBehavior,
      series: [
        RadialBarSeries<DailyGoalChartData, String>(
          dataSource: _chartData,
          xValueMapper: (data, _) => data.x,
          yValueMapper: (data, _) => data.y,
          pointColorMapper: (data, _) => data.pointColor,
          dataLabelMapper: (data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          animationDuration: 1000,
          maximumValue: 100,
          radius: '100%',
          gap: '2%',
          innerRadius: '30%',
          cornerStyle: CornerStyle.bothCurve,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _chartData.clear();
    super.dispose();
  }
}
