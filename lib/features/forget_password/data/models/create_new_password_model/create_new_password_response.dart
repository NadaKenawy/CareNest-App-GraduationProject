import 'package:json_annotation/json_annotation.dart';

part 'create_new_password_response.g.dart';

@JsonSerializable()
class CreateNewPasswordResponse {
  String? status;
  String? message;

  CreateNewPasswordResponse({
    this.status,
    this.message,
  });

  factory CreateNewPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPasswordResponseFromJson(json);
}
