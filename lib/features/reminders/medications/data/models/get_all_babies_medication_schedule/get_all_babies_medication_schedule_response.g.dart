// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_babies_medication_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBabiesMedicationScheduleResponse
    _$GetAllBabiesMedicationScheduleResponseFromJson(
            Map<String, dynamic> json) =>
        GetAllBabiesMedicationScheduleResponse(
          results: (json['results'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  BabiesMedicationData.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetAllBabiesMedicationScheduleResponseToJson(
        GetAllBabiesMedicationScheduleResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
    };

BabiesMedicationData _$BabiesMedicationDataFromJson(
        Map<String, dynamic> json) =>
    BabiesMedicationData(
      medicationName: json['medicationName'] as String?,
      time: json['time'] as String?,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      notificationSent: json['notificationSent'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BabiesMedicationDataToJson(
        BabiesMedicationData instance) =>
    <String, dynamic>{
      'medicationName': instance.medicationName,
      'time': instance.time,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'notificationSent': instance.notificationSent,
      'id': instance.id,
    };
