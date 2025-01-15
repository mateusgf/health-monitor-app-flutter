import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_monitor_app_flutter/models/user_goal.model.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String userName,
    required String name,
    required String height,
    required String weight,
    String? email,
    List<UserGoal>? userGoals, // Relationship: User can have many goals
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
