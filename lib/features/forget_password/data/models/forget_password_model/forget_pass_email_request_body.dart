import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_email_request_body.g.dart';

@JsonSerializable()
class ForgetPassEmailRequestBody {
  @JsonKey(name: 'Email')
  final String email;

  ForgetPassEmailRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$ForgetPassEmailRequestBodyToJson(this);
}
