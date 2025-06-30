// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cry_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCryResponse _$CreateCryResponseFromJson(Map<String, dynamic> json) =>
    CreateCryResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : CreateCryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCryResponseToJson(CreateCryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CreateCryData _$CreateCryDataFromJson(Map<String, dynamic> json) =>
    CreateCryData(
      id: json['_id'] as String?,
      classType: json['class'] as String?,
      audio: json['audio'] as String?,
      mother: json['mother'] as String?,
      userSatisfaction: json['userSatisfaction'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateCryDataToJson(CreateCryData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'class': instance.classType,
      'audio': instance.audio,
      'mother': instance.mother,
      'userSatisfaction': instance.userSatisfaction,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
