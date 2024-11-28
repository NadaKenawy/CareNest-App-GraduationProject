// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_medication_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMedicationScheduleResponse _$GetAllMedicationScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllMedicationScheduleResponse(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MedicationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllMedicationScheduleResponseToJson(
        GetAllMedicationScheduleResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
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
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MedicationDataToJson(MedicationData instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'notificationSent': instance.notificationSent,
      'id': instance.id,
    };
