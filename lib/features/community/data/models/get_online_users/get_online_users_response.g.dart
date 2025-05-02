// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_online_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOnlineUsersResponse _$GetOnlineUsersResponseFromJson(
        Map<String, dynamic> json) =>
    GetOnlineUsersResponse(
      status: json['status'] as String,
      results: (json['results'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOnlineUsersResponseToJson(
        GetOnlineUsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      email: json['Email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String?,
      lastSeen: json['lastSeen'] as String,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'Email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'lastSeen': instance.lastSeen,
      'isOnline': instance.isOnline,
    };
