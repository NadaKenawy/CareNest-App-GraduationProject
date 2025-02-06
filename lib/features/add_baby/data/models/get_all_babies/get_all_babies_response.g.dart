// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_babies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBabiesResponse _$GetAllBabiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllBabiesResponse(
      results: (json['results'] as num?)?.toInt(),
      babiesData: (json['data'] as List<dynamic>?)
          ?.map((e) => BabiesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBabiesResponseToJson(
        GetAllBabiesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.babiesData,
    };

BabiesData _$BabiesDataFromJson(Map<String, dynamic> json) => BabiesData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => WeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => HeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$BabiesDataToJson(BabiesData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'birthDay': instance.dateOfBirth?.toIso8601String(),
      'motherOfBaby': instance.motherOfBaby,
      'gender': instance.gender,
    };

WeightData _$WeightDataFromJson(Map<String, dynamic> json) => WeightData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$WeightDataToJson(WeightData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'weight': instance.weight,
      'status': instance.status,
      '_id': instance.id,
    };

HeightData _$HeightDataFromJson(Map<String, dynamic> json) => HeightData(
      ageCategory: json['ageCategory'] as String?,
      height: json['height'] as num?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$HeightDataToJson(HeightData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'height': instance.height,
      'status': instance.status,
      '_id': instance.id,
    };
