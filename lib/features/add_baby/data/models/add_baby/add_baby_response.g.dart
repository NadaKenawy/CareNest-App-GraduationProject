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
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => WeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => HeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: json['gender'] as String?,
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
      'gender': instance.gender,
      'birthDay': instance.dateOfBirth?.toIso8601String(),
      'motherOfBaby': instance.motherOfBaby,
    };

WeightData _$WeightDataFromJson(Map<String, dynamic> json) => WeightData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$WeightDataToJson(WeightData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'weight': instance.weight,
      '_id': instance.id,
      'status': instance.status,
    };

HeightData _$HeightDataFromJson(Map<String, dynamic> json) => HeightData(
      ageCategory: json['ageCategory'] as String?,
      height: json['height'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HeightDataToJson(HeightData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'height': instance.height,
      '_id': instance.id,
      'status': instance.status,
    };
