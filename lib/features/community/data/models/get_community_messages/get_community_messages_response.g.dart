// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_community_messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommunityMessagesResponse _$GetCommunityMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCommunityMessagesResponse(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => CommunityMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCommunityMessagesResponseToJson(
        GetCommunityMessagesResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

CommunityMessage _$CommunityMessageFromJson(Map<String, dynamic> json) =>
    CommunityMessage(
      id: json['id'] as String?,
      senderId: json['senderId'] as String?,
      fullName: json['fullName'] as String?,
      userImage: json['userImage'] as String?,
      message: json['message'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mediaUrl: json['mediaUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      messageType: json['messageType'] as String?,
      timestamp: CommunityMessage._timestampFromJson(json['timestamp']),
    );

Map<String, dynamic> _$CommunityMessageToJson(CommunityMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'fullName': instance.fullName,
      'userImage': instance.userImage,
      'message': instance.message,
      'images': instance.images,
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
      'messageType': instance.messageType,
      'timestamp': CommunityMessage._timestampToJson(instance.timestamp),
    };
