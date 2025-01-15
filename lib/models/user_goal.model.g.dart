// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_goal.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGoalImpl _$$UserGoalImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      dateStart: DateTime.parse(json['dateStart'] as String),
      dateEnd: DateTime.parse(json['dateEnd'] as String),
      dailySteps: (json['dailySteps'] as num?)?.toInt() ?? 0,
      calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$UserGoalImplToJson(_$UserGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'dateStart': instance.dateStart.toIso8601String(),
      'dateEnd': instance.dateEnd.toIso8601String(),
      'dailySteps': instance.dailySteps,
      'calories': instance.calories,
      'distance': instance.distance,
    };
