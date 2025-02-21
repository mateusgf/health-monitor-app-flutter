import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/logger.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:health_monitor_app_flutter/views/components/goal_stat_row.dart';
import 'package:health_monitor_app_flutter/views/home/home_screen_chart.dart';
import 'package:intl/intl.dart';
import 'package:open_settings_plus/open_settings_plus.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _goToSleepHistoryRoute(WidgetRef ref) {
    ref.read(routerProvider).go(appRoutesPath(AppRoute.sleep_tracks));
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  void _syncDataWithDevice() {
    logger.i('Sync data with wearable device using bluetooth');
  }

  void _openBluetoothSettings() {
    try {
      if (OpenSettingsPlus.shared is OpenSettingsPlusAndroid) {
        (OpenSettingsPlus.shared as OpenSettingsPlusAndroid).bluetooth();
      } else if (OpenSettingsPlus.shared is OpenSettingsPlusIOS) {
        (OpenSettingsPlus.shared as OpenSettingsPlusIOS).bluetooth();
      } else {
        throw Exception(t.home.error_platform_not_supported);
      }
    } catch (e) {
      logger.e('Error opening bluetooth settings: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyGoalDataRepository = ref.watch(dailyGoalDataRepositoryProvider);
    final dailyGoalData = dailyGoalDataRepository.getDailyGoalData();

    final dateString = DateFormat.yMMMEd().format(dailyGoalData.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.screen_title),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _openBluetoothSettings,
              icon: const Icon(Icons.bluetooth),
              label: Text(t.home.set_up_new_device),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            GoalStatRow(
              icon: Icons.directions_run,
              iconColor: const Color.fromRGBO(0, 201, 230, 1.0),
              label: t.home.daily_steps,
              value: dailyGoalData.steps.toString(),
            ),
            GoalStatRow(
              icon: Icons.local_fire_department,
              iconColor: const Color.fromARGB(255, 226, 125, 1),
              label: t.home.calories,
              value: '${dailyGoalData.calories} kcal',
            ),
            GoalStatRow(
              icon: Icons.navigation,
              iconColor: const Color.fromRGBO(63, 224, 0, 1.0),
              label: t.home.distance,
              value: '${dailyGoalData.distance} km',
            ),
            HomeScreenChart(dailyGoalData: dailyGoalData),
            ElevatedButton(
              onPressed: () => _goToSleepHistoryRoute(ref),
              child: Text(t.home.sleep_data),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _syncDataWithDevice,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
