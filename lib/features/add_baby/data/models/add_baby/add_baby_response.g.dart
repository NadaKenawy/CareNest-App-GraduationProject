// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_baby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBabyResponse _$AddBabyResponseFromJson(Map<String, dynamic> json) =>
    AddBabyResponse(
      babyData: json['data'] == null
          ? null
          : BabyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddBabyResponseToJson(AddBabyResponse instance) =>
    <String, dynamic>{
      'data': instance.babyData,
    };

BabyData _$BabyDataFromJson(Map<String, dynamic> json) => BabyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
    );

Map<String, dynamic> _$BabyDataToJson(BabyData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'birthDay': instance.dateOfBirth?.toIso8601String(),
      'motherOfBaby': instance.motherOfBaby,
    };
