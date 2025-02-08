// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_height_growth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyHeightGrowthResponse _$BabyHeightGrowthResponseFromJson(
        Map<String, dynamic> json) =>
    BabyHeightGrowthResponse(
      data: json['data'] == null
          ? null
          : GrowthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BabyHeightGrowthResponseToJson(
        BabyHeightGrowthResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GrowthData _$GrowthDataFromJson(Map<String, dynamic> json) => GrowthData(
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => MeasurementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrowthDataToJson(GrowthData instance) =>
    <String, dynamic>{
      'height': instance.height,
    };

MeasurementData _$MeasurementDataFromJson(Map<String, dynamic> json) =>
    MeasurementData(
      ageCategory: json['ageCategory'] as String?,
      height: json['height'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MeasurementDataToJson(MeasurementData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'height': instance.height,
      '_id': instance.id,
      'status': instance.status,
    };
