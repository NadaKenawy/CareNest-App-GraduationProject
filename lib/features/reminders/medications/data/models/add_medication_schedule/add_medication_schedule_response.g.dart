// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_medication_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedicationScheduleResponse _$AddMedicationScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    AddMedicationScheduleResponse(
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => MedicationScheduleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddMedicationScheduleResponseToJson(
        AddMedicationScheduleResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
    };

MedicationScheduleData _$MedicationScheduleDataFromJson(
        Map<String, dynamic> json) =>
    MedicationScheduleData(
      medicationName: json['medicationName'] as String,
      time: json['time'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      notificationSent: json['notificationSent'] as bool,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MedicationScheduleDataToJson(
        MedicationScheduleData instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin,
      'end': instance.end,
      'notificationSent': instance.notificationSent,
      'id': instance.id,
    };
