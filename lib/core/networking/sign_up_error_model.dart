import 'package:json_annotation/json_annotation.dart';
part 'sign_up_error_model.g.dart';

@JsonSerializable()
class SignUpErrorModel {
  final List<SignUpErrorDetail>? errors;

  SignUpErrorModel({
    required this.errors,
  });

  factory SignUpErrorModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpErrorModelToJson(this);
}

@JsonSerializable()
class SignUpErrorDetail {
  final String? type;
  final String? value;
  final String? msg;
  final String? path;
  final String? location;

  SignUpErrorDetail({
    required this.type,
    required this.value,
    required this.msg,
    required this.path,
    required this.location,
  });

  factory SignUpErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$SignUpErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpErrorDetailToJson(this);
}
