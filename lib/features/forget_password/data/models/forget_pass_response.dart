import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_response.g.dart';

@JsonSerializable()
class ForgetPassResponse {
  String? status;
  String? message;
  String? token;

  ForgetPassResponse({
    this.status,
    this.message,
    this.token,
  });

  factory ForgetPassResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassResponseFromJson(json);
}
