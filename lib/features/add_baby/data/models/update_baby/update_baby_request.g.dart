// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_baby_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBabyRequest _$UpdateBabyRequestFromJson(Map<String, dynamic> json) =>
    UpdateBabyRequest(
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      dateOfBirthOfBaby: json['dateOfBirthOfBaby'] as String?,
    );

Map<String, dynamic> _$UpdateBabyRequestToJson(UpdateBabyRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'dateOfBirthOfBaby': instance.dateOfBirthOfBaby,
    };
