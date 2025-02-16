// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_growth_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestGrowthDataResponse _$LatestGrowthDataResponseFromJson(
        Map<String, dynamic> json) =>
    LatestGrowthDataResponse(
      data: json['data'] == null
          ? null
          : LatestGrowthData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );


LatestGrowthData _$LatestGrowthDataFromJson(Map<String, dynamic> json) =>
    LatestGrowthData(
      latestHeight: json['latestHeight'] as num?,
      latestWeight: json['latestWeight'] as num?,
      heightStatus: json['heightStatus'] as String?,
      weightStatus: json['weightStatus'] as String?,
    );

