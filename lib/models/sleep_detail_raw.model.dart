import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_detail_raw.model.freezed.dart';
part 'sleep_detail_raw.model.g.dart';

@freezed
class SleepDetailRaw with _$SleepDetailRaw {
  const factory SleepDetailRaw({
    required int phase,
    required int duration,
  }) = _SleepDetailRaw;

  factory SleepDetailRaw.fromJson(Map<String, dynamic> json) =>
      _$SleepDetailRawFromJson(json);
}
