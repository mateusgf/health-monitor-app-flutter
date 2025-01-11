import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelectedDate = DateTime.now();
    var format = DateFormat.yMMMEd();
    var dateString = format.format(currentSelectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Track for Wearables'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.bluetooth),
            label: Text('Setup a new bluetooth device'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.all(26.0),
            child: Text(
              '$dateString',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.directions_run, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Daily steps',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_fire_department, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                'Calories',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.navigation, color: Colors.green),
              SizedBox(width: 8),
              Text(
                'Distance',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: PieChart(
                PieChartData(sections: [
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
                ]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: syncDataWithDevice,
      ),
    );
  }

  void syncDataWithDevice() {
    print('Sync data with wearable device using bluetooth');
  }
}
