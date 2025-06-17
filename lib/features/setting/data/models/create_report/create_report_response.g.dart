// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportResponse _$CreateReportResponseFromJson(
        Map<String, dynamic> json) =>
    CreateReportResponse(
      data: ReviewData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateReportResponseToJson(
        CreateReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
      title: json['title'] as String,
      ratings: json['ratings'],
      user: json['user'] as String,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ratings': instance.ratings,
      'user': instance.user,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
