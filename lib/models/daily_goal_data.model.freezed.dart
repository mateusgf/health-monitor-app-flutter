// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_goal_data.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyGoalData _$DailyGoalDataFromJson(Map<String, dynamic> json) {
  return _DailyGoalData.fromJson(json);
}

/// @nodoc
mixin _$DailyGoalData {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  double get calories => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  /// Serializes this DailyGoalData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyGoalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyGoalDataCopyWith<DailyGoalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyGoalDataCopyWith<$Res> {
  factory $DailyGoalDataCopyWith(
          DailyGoalData value, $Res Function(DailyGoalData) then) =
      _$DailyGoalDataCopyWithImpl<$Res, DailyGoalData>;
  @useResult
  $Res call(
      {String id, DateTime date, int steps, double calories, double distance});
}

/// @nodoc
class _$DailyGoalDataCopyWithImpl<$Res, $Val extends DailyGoalData>
    implements $DailyGoalDataCopyWith<$Res> {
  _$DailyGoalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyGoalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? steps = null,
    Object? calories = null,
    Object? distance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyGoalDataImplCopyWith<$Res>
    implements $DailyGoalDataCopyWith<$Res> {
  factory _$$DailyGoalDataImplCopyWith(
          _$DailyGoalDataImpl value, $Res Function(_$DailyGoalDataImpl) then) =
      __$$DailyGoalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, DateTime date, int steps, double calories, double distance});
}

/// @nodoc
class __$$DailyGoalDataImplCopyWithImpl<$Res>
    extends _$DailyGoalDataCopyWithImpl<$Res, _$DailyGoalDataImpl>
    implements _$$DailyGoalDataImplCopyWith<$Res> {
  __$$DailyGoalDataImplCopyWithImpl(
      _$DailyGoalDataImpl _value, $Res Function(_$DailyGoalDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyGoalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? steps = null,
    Object? calories = null,
    Object? distance = null,
  }) {
    return _then(_$DailyGoalDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyGoalDataImpl implements _DailyGoalData {
  const _$DailyGoalDataImpl(
      {required this.id,
      required this.date,
      this.steps = 0,
      this.calories = 0.0,
      this.distance = 0.0});

  factory _$DailyGoalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyGoalDataImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final int steps;
  @override
  @JsonKey()
  final double calories;
  @override
  @JsonKey()
  final double distance;

  @override
  String toString() {
    return 'DailyGoalData(id: $id, date: $date, steps: $steps, calories: $calories, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyGoalDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, steps, calories, distance);

  /// Create a copy of DailyGoalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyGoalDataImplCopyWith<_$DailyGoalDataImpl> get copyWith =>
      __$$DailyGoalDataImplCopyWithImpl<_$DailyGoalDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyGoalDataImplToJson(
      this,
    );
  }
}

abstract class _DailyGoalData implements DailyGoalData {
  const factory _DailyGoalData(
      {required final String id,
      required final DateTime date,
      final int steps,
      final double calories,
      final double distance}) = _$DailyGoalDataImpl;

  factory _DailyGoalData.fromJson(Map<String, dynamic> json) =
      _$DailyGoalDataImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  int get steps;
  @override
  double get calories;
  @override
  double get distance;

  /// Create a copy of DailyGoalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyGoalDataImplCopyWith<_$DailyGoalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
