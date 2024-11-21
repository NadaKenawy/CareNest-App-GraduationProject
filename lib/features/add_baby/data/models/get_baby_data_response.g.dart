// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBabyDataResponse _$GetBabyDataResponseFromJson(Map<String, dynamic> json) =>
    GetBabyDataResponse(
      results: (json['results'] as num?)?.toInt(),
      babyData: (json['data'] as List<dynamic>?)
          ?.map((e) => BabyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBabyDataResponseToJson(
        GetBabyDataResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
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
