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


GrowthData _$GrowthDataFromJson(Map<String, dynamic> json) => GrowthData(
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => MeasurementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


MeasurementData _$MeasurementDataFromJson(Map<String, dynamic> json) =>
    MeasurementData(
      ageCategory: json['ageCategory'] as String?,
      height: json['height'] as num?,
      id: json['_id'] as String?,
      status: json['status'] as String?,
    );

