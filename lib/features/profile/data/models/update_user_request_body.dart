import 'package:json_annotation/json_annotation.dart';
part 'update_user_request_body.g.dart';
@JsonSerializable()
class UpdateUserRequestBody {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirthOfMam;

  UpdateUserRequestBody({
    this.firstName,
    this.lastName,
    this.dateOfBirthOfMam,
  });

  Map<String, dynamic> toJson() => _$UpdateUserRequestBodyToJson(this);
}
