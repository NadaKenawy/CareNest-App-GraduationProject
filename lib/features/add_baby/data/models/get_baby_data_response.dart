import 'package:json_annotation/json_annotation.dart';
part 'get_baby_data_response.g.dart';

@JsonSerializable()
class GetBabyDataResponse {
  int? results;
  @JsonKey(name: 'data')
  List<BabyData>? babyData;

  GetBabyDataResponse({
    this.results,
    this.babyData,
  });

  factory GetBabyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBabyDataResponseFromJson(json);
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
