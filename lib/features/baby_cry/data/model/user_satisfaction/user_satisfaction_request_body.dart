import 'package:json_annotation/json_annotation.dart';

part 'user_satisfaction_request_body.g.dart';

@JsonSerializable()
class UserSatisfactionRequestBody {
  final String userSatisfaction;

  UserSatisfactionRequestBody({required this.userSatisfaction});

  factory UserSatisfactionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UserSatisfactionRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UserSatisfactionRequestBodyToJson(this);
} 