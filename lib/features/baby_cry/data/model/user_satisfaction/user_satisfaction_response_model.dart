import 'package:json_annotation/json_annotation.dart';

part 'user_satisfaction_response_model.g.dart';

@JsonSerializable()
class UserSatisfactionResponseModel {
  final String status;
  final CrySatisfactionData data;

  UserSatisfactionResponseModel({required this.status, required this.data});

  factory UserSatisfactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserSatisfactionResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSatisfactionResponseModelToJson(this);
}

@JsonSerializable()
class CrySatisfactionData {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'class')
  final String cryClass;
  final String audio;
  final String mother;
  final String userSatisfaction;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  CrySatisfactionData({
    required this.id,
    required this.cryClass,
    required this.audio,
    required this.mother,
    required this.userSatisfaction,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CrySatisfactionData.fromJson(Map<String, dynamic> json) =>
      _$CrySatisfactionDataFromJson(json);
  Map<String, dynamic> toJson() => _$CrySatisfactionDataToJson(this);
} 