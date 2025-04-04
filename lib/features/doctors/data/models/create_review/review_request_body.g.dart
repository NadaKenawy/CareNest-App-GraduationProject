// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequestBody _$ReviewRequestBodyFromJson(Map<String, dynamic> json) =>
    ReviewRequestBody(
      doctor: json['doctor'] as String,
      ratings: (json['ratings'] as num).toInt(),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ReviewRequestBodyToJson(ReviewRequestBody instance) =>
    <String, dynamic>{
      'doctor': instance.doctor,
      'ratings': instance.ratings,
      'user': instance.user,
    };
