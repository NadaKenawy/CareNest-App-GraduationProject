// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['Email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      dateOfBirthOfMam: json['dateOfBirthOfMam'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'Email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'dateOfBirthOfMam': instance.dateOfBirthOfMam,
    };
