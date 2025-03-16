// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hospitals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHospitalsResponse _$GetHospitalsResponseFromJson(
        Map<String, dynamic> json) =>
    GetHospitalsResponse(
      totalResults: (json['totalResults'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HospitalData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHospitalsResponseToJson(
        GetHospitalsResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'data': instance.data,
    };

HospitalData _$HospitalDataFromJson(Map<String, dynamic> json) => HospitalData(
      title: json['title'] as String?,
      phone: json['phone'] as String?,
      distance: (json['distance'] as num?)?.toInt(),
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
      access: (json['access'] as List<dynamic>?)
          ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
      district: json['district'] as String?,
      label: json['label'] as String?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$HospitalDataToJson(HospitalData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'phone': instance.phone,
      'distance': instance.distance,
      'position': instance.position,
      'access': instance.access,
      'district': instance.district,
      'label': instance.label,
      'categoryName': instance.categoryName,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
