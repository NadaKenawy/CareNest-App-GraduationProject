// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReportResponse _$UpdateReportResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateReportResponse(
      data: ReviewData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateReportResponseToJson(
        UpdateReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
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
      '_id': instance.id,
      'title': instance.title,
      'ratings': instance.ratings,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
