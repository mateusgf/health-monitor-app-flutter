import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_monitor_app_flutter/repositories/daily_goal_data.repository.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void goToSleepTrackDataRoute(WidgetRef ref) {
    ref.read(routerProvider).go(appRoutesPath(AppRoute.sleep_tracks));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTracksAsync = ref.watch(sleepTracksProvider);

    final dailyGoalDataRepository = DailyGoalDataRepository();
    final dailyGoalData = dailyGoalDataRepository.getDailyGoalData();

    print(dailyGoalData);

    var format = DateFormat.yMMMEd();
    var dateString = format.format(dailyGoalData.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Track for Wearables'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bluetooth),
            label: const Text('Setup a new bluetooth device'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(26.0),
            child: Text(
              dateString,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.directions_run, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                'Daily steps | ${dailyGoalData.steps}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_fire_department, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                'Calories | ${dailyGoalData.calories} kcal',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.navigation, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                'Distance | ${dailyGoalData.distance} km',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 10,
                      color: Colors.green,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.orange,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    PieChartSectionData(
                      value: 60,
                      title: '',
                      color: Colors.blue,
                      showTitle: true,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      badgeWidget: TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.directions_run,
                          color: Colors.white,
                        ),
                      ),
                      radius: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => goToSleepTrackDataRoute(ref),
            child: const Text('Sleep data'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: syncDataWithDevice,
      ),
    );
  }

  void syncDataWithDevice() {
    print('Sync data with wearable device using bluetooth');
  }
}
