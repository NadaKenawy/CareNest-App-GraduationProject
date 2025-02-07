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
      weight: (json['weight'] as List<dynamic>?)
          ?.map((e) => WeightHeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as List<dynamic>?)
          ?.map((e) => WeightHeightData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: json['gender'] as String?,
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
    );


WeightHeightData _$WeightHeightDataFromJson(Map<String, dynamic> json) =>
    WeightHeightData(
      ageCategory: json['ageCategory'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      status: json['status'] as String?,
      id: json['id'] as String?,
    );

