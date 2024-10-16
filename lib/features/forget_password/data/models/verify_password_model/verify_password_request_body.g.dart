// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPasswordRequestBody _$VerifyPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerifyPasswordRequestBody(
      resetCode: json['resetCode'] as String,
    );

Map<String, dynamic> _$VerifyPasswordRequestBodyToJson(
        VerifyPasswordRequestBody instance) =>
    <String, dynamic>{
      'resetCode': instance.resetCode,
    };
