import 'package:json_annotation/json_annotation.dart';
part 'get_baby_growth_response.g.dart';

@JsonSerializable()
class BabyGrowthHeightResponse {
  final List<MeasurementData>? height;

  BabyGrowthHeightResponse({
    this.height,
  });

  factory BabyGrowthHeightResponse.fromJson(Map<String, dynamic> json) =>
      _$BabyGrowthHeightResponseFromJson(json);
}

@JsonSerializable()
class MeasurementData {
  final String? ageCategory;
  final num? height;
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
