// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'forget_pass_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPassResponse _$ForgetPassResponseFromJson(Map<String, dynamic> json) =>
    ForgetPassResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ForgetPassResponseToJson(ForgetPassResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };
