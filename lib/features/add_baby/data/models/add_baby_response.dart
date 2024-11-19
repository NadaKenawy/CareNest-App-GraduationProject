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
  
}

@JsonSerializable()
class BabyData {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  num? weight;
  num? height;
  @JsonKey(name: 'birthDay')
  DateTime? dateOfBirth;
  String? motherOfBaby;

  BabyData({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.dateOfBirth,
    this.motherOfBaby,
  });

  factory BabyData.fromJson(Map<String, dynamic> json) =>
      _$BabyDataFromJson(json);

  
}
