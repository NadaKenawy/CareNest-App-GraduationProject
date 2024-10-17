import 'package:json_annotation/json_annotation.dart';

part 'verify_account_response.g.dart';

@JsonSerializable()
class VerifyAccountResponse {
  String? status;
  UserData? data;
  String? token;

  VerifyAccountResponse({this.status, this.data, this.token});

  factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyAccountResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'Email')
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;
  bool? active;
  String? dateOfBirthOfMam;
  @JsonKey(name: '_id')
  String? id;
  String? createdAt;
  String? updatedAt;
  int? ageMam;
  @JsonKey(name: '__v')
  int? version;

  UserData({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
    this.active,
    this.dateOfBirthOfMam,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.ageMam,
    this.version,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
