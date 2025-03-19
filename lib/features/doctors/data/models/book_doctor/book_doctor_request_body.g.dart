// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoCode _$PromoCodeFromJson(Map<String, dynamic> json) => PromoCode(
      code: json['code'] as String,
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PromoCodeToJson(PromoCode instance) => <String, dynamic>{
      'code': instance.code,
      'expireAt': instance.expireAt?.toIso8601String(),
      'value': instance.value,
    };

BookDoctorRequestBody _$BookDoctorRequestBodyFromJson(
        Map<String, dynamic> json) =>
    BookDoctorRequestBody(
      promocodes: (json['promocodes'] as List<dynamic>?)
          ?.map((e) => PromoCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      doctor: json['doctor'] as String,
      day: json['day'] as String,
      startTime: json['startTime'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$BookDoctorRequestBodyToJson(
        BookDoctorRequestBody instance) =>
    <String, dynamic>{
      'promocodes': instance.promocodes,
      'doctor': instance.doctor,
      'day': instance.day,
      'startTime': instance.startTime,
      'date': instance.date,
    };
