// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoctorRequestBody _$BookDoctorRequestBodyFromJson(
        Map<String, dynamic> json) =>
    BookDoctorRequestBody(
      promocode: json['promocode'] as String?,
      doctor: json['doctor'] as String,
      day: json['day'] as String,
      startTime: json['startTime'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$BookDoctorRequestBodyToJson(
        BookDoctorRequestBody instance) =>
    <String, dynamic>{
      'promocode': instance.promocode,
      'doctor': instance.doctor,
      'day': instance.day,
      'startTime': instance.startTime,
      'date': instance.date,
    };
