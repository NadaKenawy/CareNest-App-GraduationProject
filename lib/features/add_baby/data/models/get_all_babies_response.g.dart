// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_babies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBabiesResponse _$GetAllBabiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllBabiesResponse(
      results: (json['results'] as num?)?.toInt(),
      babiesData: (json['data'] as List<dynamic>?)
          ?.map((e) => BabiesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


BabiesData _$BabiesDataFromJson(Map<String, dynamic> json) => BabiesData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      dateOfBirth: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
      gender: json['gender'] as String?,
    );

