// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_baby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBabyResponse _$AddBabyResponseFromJson(Map<String, dynamic> json) =>
    AddBabyResponse(
      babyData: json['data'] == null
          ? null
          : BabyData.fromJson(json['data'] as Map<String, dynamic>),
    );


BabyData _$BabyDataFromJson(Map<String, dynamic> json) => BabyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
    );

