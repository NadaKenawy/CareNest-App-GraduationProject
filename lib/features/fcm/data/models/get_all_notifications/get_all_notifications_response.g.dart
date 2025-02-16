// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationsResponse _$GetAllNotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllNotificationsResponse(
      results: (json['results'] as num?)?.toInt(),
      notificationsData: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      recipient: json['recipient'] as String?,
    );

