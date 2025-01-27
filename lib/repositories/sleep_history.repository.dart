import 'dart:async';
import 'package:dio/dio.dart';
import 'package:health_monitor_app_flutter/models/sleep_history.model.dart';

class SleepHistoryRepository {
  final requestClient;

  SleepHistoryRepository(this.requestClient);

  Future<List<SleepHistory>> fetchSleepHistory() async {
    try {
      final response = await requestClient.get('/sleep_history');
      final List<dynamic> data = response.data;

      return data
          .map((json) => SleepHistory.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch sleep history: ${e.message}');
    }
  }
}
