// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_vaccines_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBabyVaccinesResponse _$GetBabyVaccinesResponseFromJson(
        Map<String, dynamic> json) =>
    GetBabyVaccinesResponse(
      message: json['message'] as String?,
      vaccineData: (json['data'] as List<dynamic>?)
          ?.map((e) => BabyVaccineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


BabyVaccineData _$BabyVaccineDataFromJson(Map<String, dynamic> json) =>
    BabyVaccineData(
      vaccine: json['vaccine'] == null
          ? null
          : Vaccine.fromJson(json['vaccine'] as Map<String, dynamic>),
      administered: json['administered'] as bool?,
      notificationSent: json['notificationSent'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );


Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      ageRequired: (json['ageRequired'] as num?)?.toInt(),
      dose: (json['dose'] as num?)?.toInt(),
      vaccineType: json['vaccineType'] as String?,
      description: json['description'] as String?,
      repeat: json['repeat'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

