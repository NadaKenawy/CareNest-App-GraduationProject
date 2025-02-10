// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_weight_growth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyWeightGrowthResponse _$BabyWeightGrowthResponseFromJson(
        Map<String, dynamic> json) =>
    BabyWeightGrowthResponse(
      data: json['data'] == null
          ? null
          : GrowthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BabyWeightGrowthResponseToJson(
        BabyWeightGrowthResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GrowthData _$GrowthDataFromJson(Map<String, dynamic> json) => GrowthData(
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => MeasurementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrowthDataToJson(GrowthData instance) =>
    <String, dynamic>{
      'weight': instance.weight,
    };

MeasurementData _$MeasurementDataFromJson(Map<String, dynamic> json) =>
    MeasurementData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MeasurementDataToJson(MeasurementData instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'weight': instance.weight,
      '_id': instance.id,
      'status': instance.status,
    };
