// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserImageResponse _$UpdateUserImageResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserImageResponse(
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserImageResponseToJson(
        UpdateUserImageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['Email'] as String,
      birthDay: json['BirthDay'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'Email': instance.email,
      'BirthDay': instance.birthDay,
      'image': instance.image,
    };
