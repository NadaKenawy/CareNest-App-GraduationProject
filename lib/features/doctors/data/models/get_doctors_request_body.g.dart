// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsRequestBody _$GetDoctorsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetDoctorsRequestBody(
      longitude: (json['lng'] as num).toDouble(),
      latitude: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$GetDoctorsRequestBodyToJson(
        GetDoctorsRequestBody instance) =>
    <String, dynamic>{
      'lng': instance.longitude,
      'lat': instance.latitude,
    };
