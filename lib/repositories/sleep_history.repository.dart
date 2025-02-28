import 'dart:async';
import 'package:dio/dio.dart';
import 'package:health_monitor_app_flutter/models/sleep_history.model.dart';
import 'package:health_monitor_app_flutter/services/auth_exception.dart';

class SleepHistoryRepository {
  final requestClient;

  SleepHistoryRepository(this.requestClient);

  Future<List<SleepHistory>> fetchSleepHistory() async {
    try {
      final response = await requestClient.request(
        'GET',
        '/sleep_history',
        requiresAuth: false,
      );
      final List<dynamic> data = response.data;

      return data
          .map((json) => SleepHistory.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException('Your session has expired. Please sign in again.');
      }
      throw Exception('Failed to fetch sleep history: ${e.message}');
    }
  }
}
