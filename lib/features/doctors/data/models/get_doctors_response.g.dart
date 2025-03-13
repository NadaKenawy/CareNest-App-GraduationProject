// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsResponse _$GetDoctorsResponseFromJson(Map<String, dynamic> json) =>
    GetDoctorsResponse(
      totalResults: (json['totalResults'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDoctorsResponseToJson(GetDoctorsResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'data': instance.data,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      location: json['Location'] == null
          ? null
          : LocationDetails.fromJson(json['Location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      specialty: json['Specialty'] as String?,
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'Location': instance.location,
      '_id': instance.id,
      'user': instance.user,
      'Specialty': instance.specialty,
      'image': instance.image,
      'images': instance.images,
    };

LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) =>
    LocationDetails(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      mainPlace: json['mainPlace'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationDetailsToJson(LocationDetails instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'mainPlace': instance.mainPlace,
      'address': instance.address,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
