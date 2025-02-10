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

Map<String, dynamic> _$GetBabyVaccinesResponseToJson(
        GetBabyVaccinesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.vaccineData,
    };

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

Map<String, dynamic> _$BabyVaccineDataToJson(BabyVaccineData instance) =>
    <String, dynamic>{
      'vaccine': instance.vaccine,
      'administered': instance.administered,
      'notificationSent': instance.notificationSent,
      'date': instance.date?.toIso8601String(),
    };

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      id: idFromJson(json['_id']),
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

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'ageRequired': instance.ageRequired,
      'dose': instance.dose,
      'vaccineType': instance.vaccineType,
      'description': instance.description,
      'repeat': instance.repeat,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
