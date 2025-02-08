import 'package:json_annotation/json_annotation.dart';

part 'get_baby_weight_growth_response.g.dart';

@JsonSerializable()
class BabyWeightGrowthResponse {
  final GrowthData? data;

  BabyWeightGrowthResponse({this.data});

  factory BabyWeightGrowthResponse.fromJson(Map<String, dynamic> json) =>
      _$BabyWeightGrowthResponseFromJson(json);
}

@JsonSerializable()
class GrowthData {
  final List<MeasurementData>? weight;

  GrowthData({this.weight});

  factory GrowthData.fromJson(Map<String, dynamic> json) =>
      _$GrowthDataFromJson(json);
}

@JsonSerializable()
class MeasurementData {
  final String? ageCategory;
  final num? weight;
  @JsonKey(name: "_id")
  final String? id;
  final String? status;

  MeasurementData({
    this.ageCategory,
    this.weight,
    this.id,
    this.status,
  });

  factory MeasurementData.fromJson(Map<String, dynamic> json) =>
      _$MeasurementDataFromJson(json);
}
