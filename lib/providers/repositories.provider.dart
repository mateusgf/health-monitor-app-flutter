import 'package:health_monitor_app_flutter/data/api_client.dart';
import 'package:health_monitor_app_flutter/models/sleep_detail_raw.model.dart';
import 'package:health_monitor_app_flutter/repositories/daily_goal_data.repository.dart';
import 'package:health_monitor_app_flutter/repositories/local_data.repository.dart';
import 'package:health_monitor_app_flutter/repositories/sleep_detail_raw.repository.dart';
import 'package:health_monitor_app_flutter/repositories/sleep_history.repository.dart';
import 'package:health_monitor_app_flutter/models/sleep_history.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestClient = ApiClient().dio;

final localDataRepositoryProvider = Provider<LocalDataRepository>((_) {
  return LocalDataRepository();
});

final sleepHistoryRepositoryProvider = Provider<SleepHistoryRepository>((ref) {
  return SleepHistoryRepository(requestClient);
});

final sleepTracksProvider = FutureProvider<List<SleepHistory>>((ref) async {
  final repository = ref.watch(sleepHistoryRepositoryProvider);
  return repository.fetchSleepHistory();
});

final sleepDetailRawRepositoryProvider =
    Provider<SleepDetailRawRepository>((ref) {
  return SleepDetailRawRepository(requestClient);
});

final sleepDetailRawProvider =
    FutureProvider.family<List<SleepDetailRaw>, int>((ref, id) async {
  final repository = ref.watch(sleepDetailRawRepositoryProvider);
  return repository.fetchSleepDetailRaw(id);
});

final dailyGoalDataRepositoryProvider =
    Provider<DailyGoalDataRepository>((ref) {
  return DailyGoalDataRepository();
});
