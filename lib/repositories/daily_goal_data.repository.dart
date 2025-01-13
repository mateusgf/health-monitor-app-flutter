import 'dart:convert';
import 'package:health_monitor_app_flutter/models/daily_goal_data.model.dart';

class DailyGoalDataRepository {
  DailyGoalData getDailyGoalData() {
    var dailyGoalDataJson =
        '{"id": "86341165-f660-4a2e-bcb6-62a98f3e619a", "date": "2025-01-13T18:57:00Z", "steps": 3352, "calories": 250, "distance": 1.5}';

    final Map<String, dynamic> jsonMap = jsonDecode(dailyGoalDataJson);

    final dailyGoalData = DailyGoalData.fromJson(jsonMap);

    return dailyGoalData;
  }
}
