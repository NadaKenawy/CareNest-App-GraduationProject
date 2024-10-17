import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';
@JsonSerializable()
class SignupResponse {
  String? status;
  String? message;
  String? token;

  SignupResponse({this.status, this.message, this.token});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
