// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewPasswordResponse _$CreateNewPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    CreateNewPasswordResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateNewPasswordResponseToJson(
        CreateNewPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
