// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'add_medication_schedule_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedicationScheduleRequestBody _$AddMedicationScheduleRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddMedicationScheduleRequestBody(
      medicationName: json['medicationName'] as String,
      time: json['time'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$AddMedicationScheduleRequestBodyToJson(
        AddMedicationScheduleRequestBody instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin,
      'end': instance.end,
    };
