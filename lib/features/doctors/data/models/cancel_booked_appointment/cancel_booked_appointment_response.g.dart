// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_booked_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelBookedAppointmentResponse _$CancelBookedAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    CancelBookedAppointmentResponse(
      status: json['status'] as String,
      data: CancelBookedAppointmentData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CancelBookedAppointmentResponseToJson(
        CancelBookedAppointmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CancelBookedAppointmentData _$CancelBookedAppointmentDataFromJson(
        Map<String, dynamic> json) =>
    CancelBookedAppointmentData(
      day: AppointmentDay.fromJson(json['day'] as Map<String, dynamic>),
      notificationSent: json['notificationSent'] as bool,
      id: json['_id'] as String,
      user: json['user'] as String,
      orderPrice: (json['orderPrice'] as num).toInt(),
      status: json['status'] as String,
      doctor: json['doctor'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CancelBookedAppointmentDataToJson(
        CancelBookedAppointmentData instance) =>
    <String, dynamic>{
      'day': instance.day,
      'notificationSent': instance.notificationSent,
      '_id': instance.id,
      'user': instance.user,
      'orderPrice': instance.orderPrice,
      'status': instance.status,
      'doctor': instance.doctor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
