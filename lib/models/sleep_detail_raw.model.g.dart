// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_detail_raw.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepDetailRawImpl _$$SleepDetailRawImplFromJson(Map<String, dynamic> json) =>
    _$SleepDetailRawImpl(
      phase: (json['phase'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$$SleepDetailRawImplToJson(
        _$SleepDetailRawImpl instance) =>
    <String, dynamic>{
      'phase': instance.phase,
      'duration': instance.duration,
    };
