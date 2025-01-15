import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_goal.model.freezed.dart';
part 'user_goal.model.g.dart';

@freezed
class UserGoal with _$UserGoal {
  const factory UserGoal({
    required String id,
    required String userId,
    required DateTime dateStart,
    required DateTime
        dateEnd, // If an end date is set to a goal, then that goal ended and user needs to create a new one
    @Default(0) int dailySteps,
    @Default(0.0) double calories,
    @Default(0.0) double distance,
  }) = _UserGoal;

  factory UserGoal.fromJson(Map<String, Object?> json) =>
      _$UserGoalFromJson(json);
}
