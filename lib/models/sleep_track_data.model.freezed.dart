// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_track_data.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SleepTrackData _$SleepTrackDataFromJson(Map<String, dynamic> json) {
  return _SleepTrackData.fromJson(json);
}

/// @nodoc
mixin _$SleepTrackData {
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this SleepTrackData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepTrackData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepTrackDataCopyWith<SleepTrackData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepTrackDataCopyWith<$Res> {
  factory $SleepTrackDataCopyWith(
          SleepTrackData value, $Res Function(SleepTrackData) then) =
      _$SleepTrackDataCopyWithImpl<$Res, SleepTrackData>;
  @useResult
  $Res call({DateTime start, DateTime end, int durationInMinutes, int score});
}

/// @nodoc
class _$SleepTrackDataCopyWithImpl<$Res, $Val extends SleepTrackData>
    implements $SleepTrackDataCopyWith<$Res> {
  _$SleepTrackDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepTrackData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? durationInMinutes = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepTrackDataImplCopyWith<$Res>
    implements $SleepTrackDataCopyWith<$Res> {
  factory _$$SleepTrackDataImplCopyWith(_$SleepTrackDataImpl value,
          $Res Function(_$SleepTrackDataImpl) then) =
      __$$SleepTrackDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime start, DateTime end, int durationInMinutes, int score});
}

/// @nodoc
class __$$SleepTrackDataImplCopyWithImpl<$Res>
    extends _$SleepTrackDataCopyWithImpl<$Res, _$SleepTrackDataImpl>
    implements _$$SleepTrackDataImplCopyWith<$Res> {
  __$$SleepTrackDataImplCopyWithImpl(
      _$SleepTrackDataImpl _value, $Res Function(_$SleepTrackDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepTrackData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? durationInMinutes = null,
    Object? score = null,
  }) {
    return _then(_$SleepTrackDataImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepTrackDataImpl implements _SleepTrackData {
  const _$SleepTrackDataImpl(
      {required this.start,
      required this.end,
      required this.durationInMinutes,
      required this.score});

  factory _$SleepTrackDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepTrackDataImplFromJson(json);

  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final int durationInMinutes;
  @override
  final int score;

  @override
  String toString() {
    return 'SleepTrackData(start: $start, end: $end, durationInMinutes: $durationInMinutes, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepTrackDataImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, start, end, durationInMinutes, score);

  /// Create a copy of SleepTrackData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepTrackDataImplCopyWith<_$SleepTrackDataImpl> get copyWith =>
      __$$SleepTrackDataImplCopyWithImpl<_$SleepTrackDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepTrackDataImplToJson(
      this,
    );
  }
}

abstract class _SleepTrackData implements SleepTrackData {
  const factory _SleepTrackData(
      {required final DateTime start,
      required final DateTime end,
      required final int durationInMinutes,
      required final int score}) = _$SleepTrackDataImpl;

  factory _SleepTrackData.fromJson(Map<String, dynamic> json) =
      _$SleepTrackDataImpl.fromJson;

  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  int get durationInMinutes;
  @override
  int get score;

  /// Create a copy of SleepTrackData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepTrackDataImplCopyWith<_$SleepTrackDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
