// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_medication_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMedicationScheduleResponse _$UpdateMedicationScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateMedicationScheduleResponse(
      message: json['msg'] as String?,
      babyData: json['data'] == null
          ? null
          : BabyData.fromJson(json['data'] as Map<String, dynamic>),
      medicationSchedule: (json['medicationSchedule'] as List<dynamic>?)
          ?.map((e) => MedicationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateMedicationScheduleResponseToJson(
        UpdateMedicationScheduleResponse instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'data': instance.babyData,
      'medicationSchedule': instance.medicationSchedule,
    };

BabyData _$BabyDataFromJson(Map<String, dynamic> json) => BabyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      gender: json['gender'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      motherOfBaby: json['motherOfBaby'] as String?,
    );

Map<String, dynamic> _$BabyDataToJson(BabyData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'gender': instance.gender,
      'birthDay': instance.birthDay?.toIso8601String(),
      'motherOfBaby': instance.motherOfBaby,
    };

MedicationData _$MedicationDataFromJson(Map<String, dynamic> json) =>
    MedicationData(
      medicationName: json['medicationName'] as String?,
      time: json['time'] as String?,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      notificationSent: json['notificationSent'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$MedicationDataToJson(MedicationData instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'notificationSent': instance.notificationSent,
      '_id': instance.id,
    };
