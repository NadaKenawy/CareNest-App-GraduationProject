// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'verify_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAccountResponse _$VerifyAccountResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyAccountResponse(
      status: json['status'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyAccountResponseToJson(
        VerifyAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
    };
