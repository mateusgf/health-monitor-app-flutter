// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_detail_raw.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SleepDetailRaw _$SleepDetailRawFromJson(Map<String, dynamic> json) {
  return _SleepDetailRaw.fromJson(json);
}

/// @nodoc
mixin _$SleepDetailRaw {
  int get phase => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  /// Serializes this SleepDetailRaw to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepDetailRaw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepDetailRawCopyWith<SleepDetailRaw> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepDetailRawCopyWith<$Res> {
  factory $SleepDetailRawCopyWith(
          SleepDetailRaw value, $Res Function(SleepDetailRaw) then) =
      _$SleepDetailRawCopyWithImpl<$Res, SleepDetailRaw>;
  @useResult
  $Res call({int phase, int duration});
}

/// @nodoc
class _$SleepDetailRawCopyWithImpl<$Res, $Val extends SleepDetailRaw>
    implements $SleepDetailRawCopyWith<$Res> {
  _$SleepDetailRawCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepDetailRaw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepDetailRawImplCopyWith<$Res>
    implements $SleepDetailRawCopyWith<$Res> {
  factory _$$SleepDetailRawImplCopyWith(_$SleepDetailRawImpl value,
          $Res Function(_$SleepDetailRawImpl) then) =
      __$$SleepDetailRawImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int phase, int duration});
}

/// @nodoc
class __$$SleepDetailRawImplCopyWithImpl<$Res>
    extends _$SleepDetailRawCopyWithImpl<$Res, _$SleepDetailRawImpl>
    implements _$$SleepDetailRawImplCopyWith<$Res> {
  __$$SleepDetailRawImplCopyWithImpl(
      _$SleepDetailRawImpl _value, $Res Function(_$SleepDetailRawImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepDetailRaw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? duration = null,
  }) {
    return _then(_$SleepDetailRawImpl(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepDetailRawImpl implements _SleepDetailRaw {
  const _$SleepDetailRawImpl({required this.phase, required this.duration});

  factory _$SleepDetailRawImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepDetailRawImplFromJson(json);

  @override
  final int phase;
  @override
  final int duration;

  @override
  String toString() {
    return 'SleepDetailRaw(phase: $phase, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepDetailRawImpl &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phase, duration);

  /// Create a copy of SleepDetailRaw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepDetailRawImplCopyWith<_$SleepDetailRawImpl> get copyWith =>
      __$$SleepDetailRawImplCopyWithImpl<_$SleepDetailRawImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepDetailRawImplToJson(
      this,
    );
  }
}

abstract class _SleepDetailRaw implements SleepDetailRaw {
  const factory _SleepDetailRaw(
      {required final int phase,
      required final int duration}) = _$SleepDetailRawImpl;

  factory _SleepDetailRaw.fromJson(Map<String, dynamic> json) =
      _$SleepDetailRawImpl.fromJson;

  @override
  int get phase;
  @override
  int get duration;

  /// Create a copy of SleepDetailRaw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepDetailRawImplCopyWith<_$SleepDetailRawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
