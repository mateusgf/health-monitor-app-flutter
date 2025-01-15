// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_track_data.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepTrackDataImpl _$$SleepTrackDataImplFromJson(Map<String, dynamic> json) =>
    _$SleepTrackDataImpl(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$SleepTrackDataImplToJson(
        _$SleepTrackDataImpl instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'durationInMinutes': instance.durationInMinutes,
      'score': instance.score,
    };
