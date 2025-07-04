import 'package:json_annotation/json_annotation.dart';

part 'add_baby_response.g.dart';

@JsonSerializable()
class AddBabyResponse {
  @JsonKey(name: 'data')
  BabyData? babyData;

  AddBabyResponse({
    this.babyData,
  });

  factory AddBabyResponse.fromJson(Map<String, dynamic> json) =>
      _$AddBabyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddBabyResponseToJson(this);
}

@JsonSerializable()
class BabyData {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  List<WeightData>? weight;
  List<HeightData>? height;
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
  Map<String, dynamic> toJson() => _$BabyDataToJson(this);
}

@JsonSerializable()
class WeightData {
  String? ageCategory;
  num? weight;
  @JsonKey(name: '_id')
  String? id;
  String? status;

  WeightData({
    this.ageCategory,
    this.weight,
    this.id,
    this.status,
  });

  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeightDataToJson(this);
}

@JsonSerializable()
class HeightData {
  String? ageCategory;
  num? height;
  @JsonKey(name: '_id')
  String? id;
  String? status;

  HeightData({
    this.ageCategory,
    this.height,
    this.id,
    this.status,
  });

  factory HeightData.fromJson(Map<String, dynamic> json) =>
      _$HeightDataFromJson(json);
  Map<String, dynamic> toJson() => _$HeightDataToJson(this);
}
