import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';


@JsonSerializable()
class ApiErrorModel {
  final List<ErrorDetail>? errors;

  ApiErrorModel({
    required this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorDetail {
  final String? type;
  final String? value;
  final String? msg;
  final String? path;
  final String? location;

  ErrorDetail({
    required this.type,
    required this.value,
    required this.msg,
    required this.path,
    required this.location,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}
