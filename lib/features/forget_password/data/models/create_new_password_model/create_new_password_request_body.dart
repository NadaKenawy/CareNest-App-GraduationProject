import 'package:json_annotation/json_annotation.dart';

part 'create_new_password_request_body.g.dart';

@JsonSerializable()
class CreateNewPasswordRequestBody {
  @JsonKey(name: 'newPassword')
  final String newPassword;

  @JsonKey(name: 'passwordConfirm')
  final String passwordConfirm;

  CreateNewPasswordRequestBody({
    required this.newPassword,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => _$CreateNewPasswordRequestBodyToJson(this);
}
