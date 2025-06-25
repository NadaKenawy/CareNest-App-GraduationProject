// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportRequestBody _$CreateReportRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateReportRequestBody(
      title: json['title'] as String,
      ratings: json['ratings'],
    );

Map<String, dynamic> _$CreateReportRequestBodyToJson(
        CreateReportRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ratings': instance.ratings,
    };
