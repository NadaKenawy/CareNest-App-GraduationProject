// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'verify_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPasswordResponse _$VerifyPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyPasswordResponse(
      status: json['status'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyPasswordResponseToJson(
        VerifyPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
    };
