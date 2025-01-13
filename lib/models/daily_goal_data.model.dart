import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_goal_data.model.freezed.dart';
part 'daily_goal_data.model.g.dart';

@freezed
class DailyGoalData with _$DailyGoalData {
  const factory DailyGoalData({
    required String id,
    required DateTime date,
    @Default(0) int steps,
    @Default(0.0) double calories,
    @Default(0.0) double distance,
  }) = _DailyGoalData;

  factory DailyGoalData.fromJson(Map<String, Object?> json) =>
      _$DailyGoalDataFromJson(json);
}
