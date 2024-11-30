// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_medication_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMedicationScheduleRequest _$UpdateMedicationScheduleRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateMedicationScheduleRequest(
      medicationName: json['medicationName'] as String?,
      time: json['time'] as String?,
      begin: json['begin'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$UpdateMedicationScheduleRequestToJson(
        UpdateMedicationScheduleRequest instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin,
      'end': instance.end,
    };
