// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpErrorModel _$SignUpErrorModelFromJson(Map<String, dynamic> json) =>
    SignUpErrorModel(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => SignUpErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SignUpErrorModelToJson(SignUpErrorModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

SignUpErrorDetail _$SignUpErrorDetailFromJson(Map<String, dynamic> json) =>
    SignUpErrorDetail(
      type: json['type'] as String?,
      value: json['value'] as String?,
      msg: json['msg'] as String?,
      path: json['path'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$SignUpErrorDetailToJson(SignUpErrorDetail instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'msg': instance.msg,
      'path': instance.path,
      'location': instance.location,
    };
