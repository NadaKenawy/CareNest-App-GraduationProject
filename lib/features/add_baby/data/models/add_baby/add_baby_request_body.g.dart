// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_baby_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBabyRequestBody _$AddBabyRequestBodyFromJson(Map<String, dynamic> json) =>
    AddBabyRequestBody(
      name: json['name'] as String,
      weight: json['weight'] as num,
      height: json['height'] as num,
      dateOfBirthOfBaby: json['dateOfBirthOfBaby'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$AddBabyRequestBodyToJson(AddBabyRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'dateOfBirthOfBaby': instance.dateOfBirthOfBaby,
      'gender': instance.gender,
    };
