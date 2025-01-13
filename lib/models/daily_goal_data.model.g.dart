// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_goal_data.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyGoalDataImpl _$$DailyGoalDataImplFromJson(Map<String, dynamic> json) =>
    _$DailyGoalDataImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      steps: (json['steps'] as num?)?.toInt() ?? 0,
      calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DailyGoalDataImplToJson(_$DailyGoalDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'steps': instance.steps,
      'calories': instance.calories,
      'distance': instance.distance,
    };
