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

Map<String, dynamic> _$LatestGrowthDataResponseToJson(
        LatestGrowthDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

LatestGrowthData _$LatestGrowthDataFromJson(Map<String, dynamic> json) =>
    LatestGrowthData(
      latestHeight: json['latestHeight'] as num?,
      latestWeight: json['latestWeight'] as num?,
      heightStatus: json['heightStatus'] as String?,
      weightStatus: json['weightStatus'] as String?,
    );

Map<String, dynamic> _$LatestGrowthDataToJson(LatestGrowthData instance) =>
    <String, dynamic>{
      'latestHeight': instance.latestHeight,
      'latestWeight': instance.latestWeight,
      'heightStatus': instance.heightStatus,
      'weightStatus': instance.weightStatus,
    };
