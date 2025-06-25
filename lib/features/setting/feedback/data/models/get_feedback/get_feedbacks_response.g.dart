// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feedbacks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedbacksResponse _$GetFeedbacksResponseFromJson(
        Map<String, dynamic> json) =>
    GetFeedbacksResponse(
      feedbacks: (json['feedbacks'] as List<dynamic>)
          .map((e) => FeedbackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: StatsModel.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFeedbacksResponseToJson(
        GetFeedbacksResponse instance) =>
    <String, dynamic>{
      'feedbacks': instance.feedbacks,
      'stats': instance.stats,
    };

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      ratings: (json['ratings'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'ratings': instance.ratings,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
    };

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) => StatsModel(
      averageRating: json['averageRating'] as String,
      percentage: json['percentage'] as String,
      totalReports: (json['totalReports'] as num).toInt(),
    );

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'percentage': instance.percentage,
      'totalReports': instance.totalReports,
    };
