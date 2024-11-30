// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_medication_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMedicationScheduleResponse _$UpdateMedicationScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateMedicationScheduleResponse(
      medicationScheduleData: json['data'] == null
          ? null
          : MedicationScheduleData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateMedicationScheduleResponseToJson(
        UpdateMedicationScheduleResponse instance) =>
    <String, dynamic>{
      'data': instance.medicationScheduleData,
    };

MedicationScheduleData _$MedicationScheduleDataFromJson(
        Map<String, dynamic> json) =>
    MedicationScheduleData(
      id: json['_id'] as String?,
      medicationName: json['medicationName'] as String?,
      time: json['time'] as String?,
      begin: json['begin'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$MedicationScheduleDataToJson(
        MedicationScheduleData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin,
      'end': instance.end,
    };
