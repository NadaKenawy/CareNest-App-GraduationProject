import 'package:json_annotation/json_annotation.dart';
part 'update_baby_image_response.g.dart';
@JsonSerializable()
class UpdateBabyImageResponse {
  @JsonKey(name: 'data')
  BabyData? babyData;

  UpdateBabyImageResponse({
    this.babyData,
  });

  factory UpdateBabyImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBabyImageResponseFromJson(json);
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
  String? babyImage;

  BabyData({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.gender,
    this.dateOfBirth,
    this.motherOfBaby,
    this.babyImage,
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
