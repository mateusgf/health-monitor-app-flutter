import 'dart:async';
import 'package:dio/dio.dart';
import 'package:health_monitor_app_flutter/constants/sleep_tracking_constants.dart';
import 'package:health_monitor_app_flutter/data/api_client.dart';
import 'package:health_monitor_app_flutter/models/sleep_detail_raw.model.dart';
import 'package:health_monitor_app_flutter/services/auth_exception.dart';

class SleepDetailRawRepository {
  final ApiClient requestClient;

  SleepDetailRawRepository(this.requestClient);

  Future<List<SleepDetailRaw>> fetchSleepDetailRaw(int id) async {
    try {
      final response = await requestClient.request(
        'GET',
        '/sleep_detail/$id',
        requiresAuth: true,
      );

      final List<dynamic> data = response.data;
      return data
          .map((json) => SleepDetailRaw.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException('Your session has expired. Please sign in again.');
      }
      throw Exception('Failed to fetch sleep history: ${e.message}');
    }
  }

  // @TODO: remove this. This is just a mocked example
  Future<List<SleepDetailRaw>> fetchSleepDetailRawMocked() async {
    await Future.delayed(const Duration(seconds: 1));

    /*
    [
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
    */

    return [
      const SleepDetailRaw(phase: LIGHT_SLEEP_INDEX, duration: 20),
      const SleepDetailRaw(phase: AWAKE_INDEX, duration: 5),
      const SleepDetailRaw(phase: LIGHT_SLEEP_INDEX, duration: 35),
      const SleepDetailRaw(phase: DEEP_SLEEP_INDEX, duration: 35),
      const SleepDetailRaw(phase: LIGHT_SLEEP_INDEX, duration: 25),
      const SleepDetailRaw(phase: REM_INDEX, duration: 60),
      const SleepDetailRaw(phase: AWAKE_INDEX, duration: 10),
      const SleepDetailRaw(phase: LIGHT_SLEEP_INDEX, duration: 110),
      const SleepDetailRaw(phase: AWAKE_INDEX, duration: 5),
      const SleepDetailRaw(phase: DEEP_SLEEP_INDEX, duration: 25),
      const SleepDetailRaw(phase: LIGHT_SLEEP_INDEX, duration: 90),
    ];
  }
}
