import 'dart:async';
import 'package:health_monitor_app_flutter/models/sleep_track_data.model.dart';

class SleepTrackDataRepository {
  Future<List<SleepTrackData>> fetchSleepTracks() async {
    // @TODO: fetch data from API
    await Future.delayed(const Duration(seconds: 3));

    // @TODO: return data from API
    return [
      SleepTrackData(
        start: DateTime.now().subtract(const Duration(hours: 8)),
        end: DateTime.now(),
        durationInMinutes: 8 * 60,
        score: 85,
      ),
      SleepTrackData(
        start: DateTime.now().subtract(const Duration(hours: 24)),
        end: DateTime.now().subtract(const Duration(hours: 16)),
        durationInMinutes: 7 * 60,
        score: 75,
      ),
    ];
  }
}
