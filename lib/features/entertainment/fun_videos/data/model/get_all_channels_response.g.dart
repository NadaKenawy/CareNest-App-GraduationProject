// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_channels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllChannelsResponse _$GetAllChannelsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllChannelsResponse(
      results: (json['results'] as num?)?.toInt(),
      paginationResult: json['paginationResult'] == null
          ? null
          : PaginationResult.fromJson(
              json['paginationResult'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChannelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllChannelsResponseToJson(
        GetAllChannelsResponse instance) =>
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

ChannelData _$ChannelDataFromJson(Map<String, dynamic> json) => ChannelData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      url: json['url'] as String?,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => ChannelVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChannelDataToJson(ChannelData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'url': instance.url,
      'videos': instance.videos,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

ChannelVideo _$ChannelVideoFromJson(Map<String, dynamic> json) => ChannelVideo(
      name: json['name'] as String?,
      url: json['url'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ChannelVideoToJson(ChannelVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      '_id': instance.id,
    };
