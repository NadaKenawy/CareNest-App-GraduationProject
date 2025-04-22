import 'package:json_annotation/json_annotation.dart';
part 'update_user_response.g.dart';
@JsonSerializable()
class UpdateUserResponse {
  final UserData data;

  UpdateUserResponse({required this.data});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String id;
  final String firstName;
 
  final String lastName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'BirthDay')
  final String birthDay;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDay,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
