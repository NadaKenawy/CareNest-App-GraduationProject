import 'package:json_annotation/json_annotation.dart';

part 'update_baby_response.g.dart';

@JsonSerializable()
class UpdateBabyResponse {
  @JsonKey(name: 'data')
  BabyData? babyData;

  UpdateBabyResponse({
    this.babyData,
  });

  factory UpdateBabyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBabyResponseFromJson(json);
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
}
