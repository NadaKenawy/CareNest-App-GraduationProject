// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: json['status'] != null ? json['status'] as String : 'Unknown',
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : ErrorDetail(statusCode: 500, status: 'Error', isOperational: false),
      message: json['message'] != null
          ? json['message'] as String
          : 'No message available',
      stack: json['stack'] != null ? json['stack'] as String : 'No stack trace',
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'stack': instance.stack,
    };

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
      statusCode: json['statusCode'] != null
          ? (json['statusCode'] as num).toInt()
          : 500,
      status: json['status'] != null ? json['status'] as String : 'Error',
      isOperational:
          json['isOperational'] != null ? json['isOperational'] as bool : false,
    );

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'isOperational': instance.isOperational,
    };
