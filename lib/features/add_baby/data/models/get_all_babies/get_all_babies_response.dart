import 'package:json_annotation/json_annotation.dart';

part 'get_all_babies_response.g.dart';

@JsonSerializable()
class GetAllBabiesResponse {
  int? results;
  @JsonKey(name: 'data')
  List<BabiesData>? babiesData;

  GetAllBabiesResponse({
    this.results,
    this.babiesData,
  });

  factory GetAllBabiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllBabiesResponseFromJson(json);
}

@JsonSerializable()
class BabiesData {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  List<WeightData>? weight;
  List<HeightData>? height;
  @JsonKey(name: 'birthDay')
  DateTime? dateOfBirth;
  String? motherOfBaby;
  String? gender;
  String? babyImage;

  BabiesData({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.dateOfBirth,
    this.motherOfBaby,
    this.gender,
    this.babyImage,
  });

  factory BabiesData.fromJson(Map<String, dynamic> json) =>
      _$BabiesDataFromJson(json);
}

@JsonSerializable()
class WeightData {
  String? ageCategory;
  num? weight;
  String? status;
  @JsonKey(name: '_id')
  String? id;

  WeightData({
    this.ageCategory,
    this.weight,
    this.status,
    this.id,
  });

  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);
}

@JsonSerializable()
class HeightData {
  String? ageCategory;
  num? height;
  String? status;
  @JsonKey(name: '_id')
  String? id;

  HeightData({
    this.ageCategory,
    this.height,
    this.status,
    this.id,
  });

  factory HeightData.fromJson(Map<String, dynamic> json) =>
      _$HeightDataFromJson(json);
}
