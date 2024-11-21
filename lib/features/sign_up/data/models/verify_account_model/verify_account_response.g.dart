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

Map<String, dynamic> _$VerifyAccountResponseToJson(
        VerifyAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'token': instance.token,
    };

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

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'Email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'active': instance.active,
      'dateOfBirthOfMam': instance.dateOfBirthOfMam,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'ageMam': instance.ageMam,
      '__v': instance.version,
    };
