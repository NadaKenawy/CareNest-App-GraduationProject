// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_baby_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBabyRequestBody _$AddBabyRequestBodyFromJson(Map<String, dynamic> json) =>
    AddBabyRequestBody(
      name: json['name'] as String,
      weightEntry: json['weightEntry'] as num,
      heightEntry: json['heightEntry'] as num,
      dateOfBirthOfBaby: json['dateOfBirthOfBaby'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$AddBabyRequestBodyToJson(AddBabyRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weightEntry': instance.weightEntry,
      'heightEntry': instance.heightEntry,
      'dateOfBirthOfBaby': instance.dateOfBirthOfBaby,
      'gender': instance.gender,
    };
