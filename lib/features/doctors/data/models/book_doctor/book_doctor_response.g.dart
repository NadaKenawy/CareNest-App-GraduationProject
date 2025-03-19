// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoctorResponse _$BookDoctorResponseFromJson(Map<String, dynamic> json) =>
    BookDoctorResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DoctorBookingData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookDoctorResponseToJson(BookDoctorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DoctorBookingData _$DoctorBookingDataFromJson(Map<String, dynamic> json) =>
    DoctorBookingData(
      user: json['user'] as String?,
      orderPrice: json['orderPrice'] as num?,
      status: json['status'] as String?,
      doctor: json['doctor'] as String?,
      day: json['day'] == null
          ? null
          : BookingDayData.fromJson(json['day'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorBookingDataToJson(DoctorBookingData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'orderPrice': instance.orderPrice,
      'status': instance.status,
      'doctor': instance.doctor,
      'day': instance.day,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
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
