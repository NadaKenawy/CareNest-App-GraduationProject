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
  num? weight;
  num? height;
  @JsonKey(name: 'birthDay')
  DateTime? dateOfBirth;
  String? motherOfBaby;

  BabiesData({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.dateOfBirth,
    this.motherOfBaby,
  });

  factory BabiesData.fromJson(Map<String, dynamic> json) =>
      _$BabiesDataFromJson(json);
}
