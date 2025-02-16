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


GrowthData _$GrowthDataFromJson(Map<String, dynamic> json) => GrowthData(
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => MeasurementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


MeasurementData _$MeasurementDataFromJson(Map<String, dynamic> json) =>
    MeasurementData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

