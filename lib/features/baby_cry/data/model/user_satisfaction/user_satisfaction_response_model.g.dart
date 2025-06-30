// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_satisfaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSatisfactionResponseModel _$UserSatisfactionResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserSatisfactionResponseModel(
      status: json['status'] as String,
      data: CrySatisfactionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSatisfactionResponseModelToJson(
        UserSatisfactionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CrySatisfactionData _$CrySatisfactionDataFromJson(Map<String, dynamic> json) =>
    CrySatisfactionData(
      id: json['_id'] as String,
      cryClass: json['class'] as String,
      audio: json['audio'] as String,
      mother: json['mother'] as String,
      userSatisfaction: json['userSatisfaction'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CrySatisfactionDataToJson(
        CrySatisfactionData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'class': instance.cryClass,
      'audio': instance.audio,
      'mother': instance.mother,
      'userSatisfaction': instance.userSatisfaction,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
