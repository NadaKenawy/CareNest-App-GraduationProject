// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_baby_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBabyRequest _$UpdateBabyRequestFromJson(Map<String, dynamic> json) =>
    UpdateBabyRequest(
      id: json['id'] as String,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      dateOfBirthOfBaby: json['dateOfBirthOfBaby'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$UpdateBabyRequestToJson(UpdateBabyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'dateOfBirthOfBaby': instance.dateOfBirthOfBaby,
      'gender': instance.gender,
    };
