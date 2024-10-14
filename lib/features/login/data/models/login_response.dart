import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'data')
  UserData? userData;
  String? token;

  LoginResponse({
    this.userData,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'Email')
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  bool? active;
  @JsonKey(name: 'dateOfBirthOfMam')
  DateTime? dateOfBirth;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? ageMam;

  UserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.active,
    this.dateOfBirth,
    this.createdAt,
    this.updatedAt,
    this.ageMam,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
