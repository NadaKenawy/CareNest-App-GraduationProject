import 'package:json_annotation/json_annotation.dart';
part 'update_user_image_response.g.dart';
@JsonSerializable()
class UpdateUserImageResponse {
  final UserData data;

  UpdateUserImageResponse({required this.data});

  factory UpdateUserImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserImageResponseToJson(this);
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
  final String image;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDay,
    required this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
