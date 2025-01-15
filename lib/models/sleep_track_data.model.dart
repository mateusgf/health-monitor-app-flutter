import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_track_data.model.freezed.dart';
part 'sleep_track_data.model.g.dart';

@freezed
class SleepTrackData with _$SleepTrackData {
  const factory SleepTrackData({
    required DateTime start,
    required DateTime end,
    required int durationInMinutes,
    required int score,
  }) = _SleepTrackData;

  factory SleepTrackData.fromJson(Map<String, dynamic> json) =>
      _$SleepTrackDataFromJson(json);
}
