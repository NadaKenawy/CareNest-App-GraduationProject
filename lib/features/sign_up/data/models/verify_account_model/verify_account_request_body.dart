import 'package:json_annotation/json_annotation.dart';
part 'verify_account_request_body.g.dart';

@JsonSerializable()
class VerifyAccountRequestBody {
  final String code;

  VerifyAccountRequestBody({
    required this.code,
  });

  Map<String, dynamic> toJson() => _$VerifyAccountRequestBodyToJson(this);
}
