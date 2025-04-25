// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoctorResponse _$BookDoctorResponseFromJson(Map<String, dynamic> json) =>
    BookDoctorResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DoctorBookingData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookDoctorResponseToJson(BookDoctorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DoctorBookingData _$DoctorBookingDataFromJson(Map<String, dynamic> json) =>
    DoctorBookingData(
      id: json['id'] as String?,
      appointmentDateTime: json['appointmentDateTime'] as String?,
      day: json['day'] == null
          ? null
          : BookingDayData.fromJson(json['day'] as Map<String, dynamic>),
      status: json['status'] as String?,
      isExpired: json['isExpired'] as bool?,
      orderPrice: json['orderPrice'] as num?,
    );

Map<String, dynamic> _$DoctorBookingDataToJson(DoctorBookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentDateTime': instance.appointmentDateTime,
      'day': instance.day,
      'status': instance.status,
      'isExpired': instance.isExpired,
      'orderPrice': instance.orderPrice,
    };

BookingDayData _$BookingDayDataFromJson(Map<String, dynamic> json) =>
    BookingDayData(
      type: json['type'] as String?,
      time: json['time'] == null
          ? null
          : BookingTimeData.fromJson(json['time'] as Map<String, dynamic>),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$BookingDayDataToJson(BookingDayData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'time': instance.time,
      'date': instance.date,
    };

BookingTimeData _$BookingTimeDataFromJson(Map<String, dynamic> json) =>
    BookingTimeData(
      startTime: json['startTime'] as String?,
    );

Map<String, dynamic> _$BookingTimeDataToJson(BookingTimeData instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
    };
