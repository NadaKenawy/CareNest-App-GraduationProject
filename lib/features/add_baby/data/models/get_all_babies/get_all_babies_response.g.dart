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
      weight: json['weight'] as num?,
      height: json['height'] as num?,
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
