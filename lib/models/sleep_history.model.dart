import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_history.model.freezed.dart';
part 'sleep_history.model.g.dart';

@freezed
class SleepHistory with _$SleepHistory {
  const factory SleepHistory({
    required int id,
    required DateTime start,
    required DateTime end,
    required int durationInMinutes,
    required int score,
  }) = _SleepHistory;

  factory SleepHistory.fromJson(Map<String, dynamic> json) =>
      _$SleepHistoryFromJson(json);
}
