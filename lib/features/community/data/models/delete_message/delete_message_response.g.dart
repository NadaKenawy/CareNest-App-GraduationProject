// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMessageResponse _$DeleteMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteMessageResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteMessageResponseToJson(
        DeleteMessageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
