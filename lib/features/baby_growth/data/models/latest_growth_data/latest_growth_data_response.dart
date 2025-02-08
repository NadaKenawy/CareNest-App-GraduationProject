import 'package:json_annotation/json_annotation.dart';

part 'latest_growth_data_response.g.dart';

@JsonSerializable()
class LatestGrowthDataResponse {
  final LatestGrowthData? data;
  final bool success;

  LatestGrowthDataResponse({this.data, required this.success});

  factory LatestGrowthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestGrowthDataResponseFromJson(json);
}

@JsonSerializable()
class LatestGrowthData {
  final num? latestHeight;
  final num? latestWeight;
  final String? heightStatus;
  final String? weightStatus;

  LatestGrowthData({
    this.latestHeight,
    this.latestWeight,
    this.heightStatus,
    this.weightStatus,
  });

  factory LatestGrowthData.fromJson(Map<String, dynamic> json) =>
      _$LatestGrowthDataFromJson(json);
}
