import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String status;
  final ErrorDetail error;
  final String message;
  final String stack;

  ApiErrorModel({
    required this.status,
    required this.error,
    required this.message,
    required this.stack,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorDetail {
  final int statusCode;
  final String status;
  final bool isOperational;

  ErrorDetail({
    required this.statusCode,
    required this.status,
    required this.isOperational,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}
