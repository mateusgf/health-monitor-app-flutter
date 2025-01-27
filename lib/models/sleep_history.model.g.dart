// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_history.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepHistoryImpl _$$SleepHistoryImplFromJson(Map<String, dynamic> json) =>
    _$SleepHistoryImpl(
      id: (json['id'] as num).toInt(),
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$SleepHistoryImplToJson(_$SleepHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'durationInMinutes': instance.durationInMinutes,
      'score': instance.score,
    };
