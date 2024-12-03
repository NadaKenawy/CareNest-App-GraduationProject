// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_baby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBabyResponse _$UpdateBabyResponseFromJson(Map<String, dynamic> json) =>
    UpdateBabyResponse(
      babyData: json['data'] == null
          ? null
          : BabyData.fromJson(json['data'] as Map<String, dynamic>),
    );


BabyData _$BabyDataFromJson(Map<String, dynamic> json) => BabyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      gender: json['gender'] as String?,
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
    );

