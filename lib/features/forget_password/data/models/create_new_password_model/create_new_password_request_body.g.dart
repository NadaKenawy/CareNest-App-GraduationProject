// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'create_new_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewPasswordRequestBody _$CreateNewPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateNewPasswordRequestBody(
      newPassword: json['newPassword'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
    );

Map<String, dynamic> _$CreateNewPasswordRequestBodyToJson(
        CreateNewPasswordRequestBody instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'passwordConfirm': instance.passwordConfirm,
    };
