// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booked_appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookedAppointmentsResponse _$GetBookedAppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    GetBookedAppointmentsResponse(
      status: json['status'] as String,
      results: (json['results'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => BookedAppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookedAppointmentsResponseToJson(
        GetBookedAppointmentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

BookedAppointmentData _$BookedAppointmentDataFromJson(
        Map<String, dynamic> json) =>
    BookedAppointmentData(
      day: AppointmentDay.fromJson(json['day'] as Map<String, dynamic>),
      id: json['_id'] as String,
      appointmentPrice: (json['orderPrice'] as num).toInt(),
      status: json['status'] as String,
      doctor:
          AppointmentDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookedAppointmentDataToJson(
        BookedAppointmentData instance) =>
    <String, dynamic>{
      'day': instance.day,
      '_id': instance.id,
      'orderPrice': instance.appointmentPrice,
      'status': instance.status,
      'doctor': instance.doctor,
    };

AppointmentDay _$AppointmentDayFromJson(Map<String, dynamic> json) =>
    AppointmentDay(
      time: AppointmentTime.fromJson(json['time'] as Map<String, dynamic>),
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$AppointmentDayToJson(AppointmentDay instance) =>
    <String, dynamic>{
      'time': instance.time,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
    };

AppointmentTime _$AppointmentTimeFromJson(Map<String, dynamic> json) =>
    AppointmentTime(
      startTime: json['startTime'] as String,
    );

Map<String, dynamic> _$AppointmentTimeToJson(AppointmentTime instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
    };

AppointmentDoctor _$AppointmentDoctorFromJson(Map<String, dynamic> json) =>
    AppointmentDoctor(
      id: json['_id'] as String,
      id2: json['id2'] as String?,
    );

Map<String, dynamic> _$AppointmentDoctorToJson(AppointmentDoctor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'id2': instance.id2,
    };
