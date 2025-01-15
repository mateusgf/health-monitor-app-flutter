// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      name: json['name'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      email: json['email'] as String?,
      userGoals: (json['userGoals'] as List<dynamic>?)
          ?.map((e) => UserGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'email': instance.email,
      'userGoals': instance.userGoals?.map((e) => e.toJson()).toList(),
    };
