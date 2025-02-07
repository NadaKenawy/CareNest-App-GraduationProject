import 'package:json_annotation/json_annotation.dart';

part 'put_growth_data_response.g.dart';

@JsonSerializable()
class PutGrowthDataResponse {
  @JsonKey(name: 'data')
  BabyData? babyData;

  PutGrowthDataResponse({this.babyData});

  factory PutGrowthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PutGrowthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PutGrowthDataResponseToJson(this);
}

@JsonSerializable()
class BabyData {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  List<WeightHeightData>? weight;  
  List<WeightHeightData>? height;  
  String? gender;
  @JsonKey(name: 'birthDay')
  DateTime? dateOfBirth;
  String? motherOfBaby;

  BabyData({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.gender,
    this.dateOfBirth,
    this.motherOfBaby,
  });

  factory BabyData.fromJson(Map<String, dynamic> json) =>
      _$BabyDataFromJson(json);

  Map<String, dynamic> toJson() => _$BabyDataToJson(this);
}

@JsonSerializable()
class WeightHeightData {
  @JsonKey(name: 'ageCategory')
  String? ageCategory;
  num? weight;
  num? height;
  String? status; 
  String? id;

  WeightHeightData({
    this.ageCategory,
    this.weight,
    this.height,
    this.status,
    this.id,
  });

  factory WeightHeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightHeightDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeightHeightDataToJson(this);
}
