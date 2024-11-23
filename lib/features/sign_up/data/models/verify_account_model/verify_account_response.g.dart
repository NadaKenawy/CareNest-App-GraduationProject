// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAccountResponse _$VerifyAccountResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyAccountResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );


UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      email: json['Email'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      role: json['role'] as String?,
      active: json['active'] as bool?,
      dateOfBirthOfMam: json['dateOfBirthOfMam'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      ageMam: (json['ageMam'] as num?)?.toInt(),
      version: (json['__v'] as num?)?.toInt(),
    );

