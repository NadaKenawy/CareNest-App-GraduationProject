import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String firstName;
  final String lastName;
  @JsonKey(name: 'Email')
  final String email;
  final String password;
  final String passwordConfirm;
  final String dateOfBirthOfMam;

  SignupRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.dateOfBirthOfMam,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
