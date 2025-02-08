import 'package:json_annotation/json_annotation.dart';

part 'get_baby_height_growth_response.g.dart';

@JsonSerializable()
class BabyHeightGrowthResponse {
  final GrowthData? data;

  BabyHeightGrowthResponse({this.data});

  factory BabyHeightGrowthResponse.fromJson(Map<String, dynamic> json) =>
      _$BabyHeightGrowthResponseFromJson(json);
}

@JsonSerializable()
class GrowthData {
  final List<MeasurementData>? height;

  GrowthData({this.height});

  factory GrowthData.fromJson(Map<String, dynamic> json) =>
      _$GrowthDataFromJson(json);
}

@JsonSerializable()
class MeasurementData {
  final String? ageCategory;
  final num? height;
  @JsonKey(name: "_id")
  final String? id;
  final String? status;

  MeasurementData({
    this.ageCategory,
    this.height,
    this.id,
    this.status,
  });

  factory MeasurementData.fromJson(Map<String, dynamic> json) =>
      _$MeasurementDataFromJson(json);
}
