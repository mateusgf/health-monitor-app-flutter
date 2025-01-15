import 'package:health_monitor_app_flutter/repositories/local_data.repository.dart';
import 'package:health_monitor_app_flutter/repositories/sleep_track_data.repository.dart';
import 'package:health_monitor_app_flutter/models/sleep_track_data.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDataRepositoryProvider = Provider<LocalDataRepository>((_) {
  return LocalDataRepository();
});

final sleepTrackRepositoryProvider = Provider<SleepTrackDataRepository>((ref) {
  return SleepTrackDataRepository();
});

final sleepTracksProvider = FutureProvider<List<SleepTrackData>>((ref) async {
  final repository = ref.watch(sleepTrackRepositoryProvider);
  return repository.fetchSleepTracks();
});
