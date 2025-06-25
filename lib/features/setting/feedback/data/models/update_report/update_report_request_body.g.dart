// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReportRequestBody _$UpdateReportRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateReportRequestBody(
      title: json['title'] as String,
      ratings: json['ratings'],
    );

Map<String, dynamic> _$UpdateReportRequestBodyToJson(
        UpdateReportRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ratings': instance.ratings,
    };
