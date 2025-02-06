// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_baby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBabyResponse _$UpdateBabyResponseFromJson(Map<String, dynamic> json) =>
    UpdateBabyResponse(
      babyData: json['data'] == null
          ? null
          : BabyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateBabyResponseToJson(UpdateBabyResponse instance) =>
    <String, dynamic>{
      'data': instance.babyData,
    };

BabyData _$BabyDataFromJson(Map<String, dynamic> json) => BabyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => WeightHeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => WeightHeightData.fromJson(e as Map<String, dynamic>))
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

WeightHeightData _$WeightHeightDataFromJson(Map<String, dynamic> json) =>
    WeightHeightData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      status: json['status'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WeightHeightDataToJson(WeightHeightData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'weight': instance.weight,
      'height': instance.height,
      'status': instance.status,
      'id': instance.id,
    };
