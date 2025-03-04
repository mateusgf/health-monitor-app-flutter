// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_history.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SleepHistory _$SleepHistoryFromJson(Map<String, dynamic> json) {
  return _SleepHistory.fromJson(json);
}

/// @nodoc
mixin _$SleepHistory {
  int get id => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this SleepHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepHistoryCopyWith<SleepHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepHistoryCopyWith<$Res> {
  factory $SleepHistoryCopyWith(
          SleepHistory value, $Res Function(SleepHistory) then) =
      _$SleepHistoryCopyWithImpl<$Res, SleepHistory>;
  @useResult
  $Res call(
      {int id, DateTime start, DateTime end, int durationInMinutes, int score});
}

/// @nodoc
class _$SleepHistoryCopyWithImpl<$Res, $Val extends SleepHistory>
    implements $SleepHistoryCopyWith<$Res> {
  _$SleepHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? durationInMinutes = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$SleepHistoryImplCopyWith<$Res>
    implements $SleepHistoryCopyWith<$Res> {
  factory _$$SleepHistoryImplCopyWith(
          _$SleepHistoryImpl value, $Res Function(_$SleepHistoryImpl) then) =
      __$$SleepHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, DateTime start, DateTime end, int durationInMinutes, int score});
}

/// @nodoc
class __$$SleepHistoryImplCopyWithImpl<$Res>
    extends _$SleepHistoryCopyWithImpl<$Res, _$SleepHistoryImpl>
    implements _$$SleepHistoryImplCopyWith<$Res> {
  __$$SleepHistoryImplCopyWithImpl(
      _$SleepHistoryImpl _value, $Res Function(_$SleepHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? durationInMinutes = null,
    Object? score = null,
  }) {
    return _then(_$SleepHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$SleepHistoryImpl implements _SleepHistory {
  const _$SleepHistoryImpl(
      {required this.id,
      required this.start,
      required this.end,
      required this.durationInMinutes,
      required this.score});

  factory _$SleepHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepHistoryImplFromJson(json);

  @override
  final int id;
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
    return 'SleepHistory(id: $id, start: $start, end: $end, durationInMinutes: $durationInMinutes, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, start, end, durationInMinutes, score);

  /// Create a copy of SleepHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepHistoryImplCopyWith<_$SleepHistoryImpl> get copyWith =>
      __$$SleepHistoryImplCopyWithImpl<_$SleepHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepHistoryImplToJson(
      this,
    );
  }
}

abstract class _SleepHistory implements SleepHistory {
  const factory _SleepHistory(
      {required final int id,
      required final DateTime start,
      required final DateTime end,
      required final int durationInMinutes,
      required final int score}) = _$SleepHistoryImpl;

  factory _SleepHistory.fromJson(Map<String, dynamic> json) =
      _$SleepHistoryImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  int get durationInMinutes;
  @override
  int get score;

  /// Create a copy of SleepHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepHistoryImplCopyWith<_$SleepHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
