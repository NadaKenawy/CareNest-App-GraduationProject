// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStoriesResponse _$GetAllStoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllStoriesResponse(
      results: (json['results'] as num?)?.toInt(),
      paginationResult: json['paginationResult'] == null
          ? null
          : PaginationResult.fromJson(
              json['paginationResult'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllStoriesResponseToJson(
        GetAllStoriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paginationResult': instance.paginationResult,
      'data': instance.data,
    };

PaginationResult _$PaginationResultFromJson(Map<String, dynamic> json) =>
    PaginationResult(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationResultToJson(PaginationResult instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numberOfPages': instance.numberOfPages,
    };

StoryData _$StoryDataFromJson(Map<String, dynamic> json) => StoryData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StoryDataToJson(StoryData instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
