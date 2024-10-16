import 'package:json_annotation/json_annotation.dart';
part 'verify_password_request_body.g.dart';

@JsonSerializable()
class VerifyPasswordRequestBody {
  final String resetCode;

  VerifyPasswordRequestBody({
    required this.resetCode,
  });

  Map<String, dynamic> toJson() => _$VerifyPasswordRequestBodyToJson(this);
}
