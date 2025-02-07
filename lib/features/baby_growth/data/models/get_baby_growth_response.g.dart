// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_growth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyGrowthHeightResponse _$BabyGrowthHeightResponseFromJson(
        Map<String, dynamic> json) =>
    BabyGrowthHeightResponse(
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => MeasurementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


MeasurementData _$MeasurementDataFromJson(Map<String, dynamic> json) =>
    MeasurementData(
      ageCategory: json['ageCategory'] as String?,
      height: json['height'] as num?,
      id: json['id'] as String?,
      status: json['status'] as String?,
    );

