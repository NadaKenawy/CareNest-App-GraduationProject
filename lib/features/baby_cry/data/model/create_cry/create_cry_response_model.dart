import 'package:json_annotation/json_annotation.dart';

part 'create_cry_response_model.g.dart';

@JsonSerializable()
class CreateCryResponse {
  final String? status;
  final CreateCryData? data;

  CreateCryResponse({this.status, this.data});

  factory CreateCryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCryResponseToJson(this);
}

@JsonSerializable()
class CreateCryData {
  final String? id;
  @JsonKey(name: 'class')
  final String? classType;
  final String? audio;
  final String? mother;
  final String? userSatisfaction;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  CreateCryData({
    this.id,
    this.classType,
    this.audio,
    this.mother,
    this.userSatisfaction,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CreateCryData.fromJson(Map<String, dynamic> json) =>
      _$CreateCryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCryDataToJson(this);
}
