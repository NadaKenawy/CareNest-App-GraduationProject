// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_music_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicResponse _$MusicResponseFromJson(Map<String, dynamic> json) =>
    MusicResponse(
      results: (json['results'] as num).toInt(),
      paginationResult: PaginationResult.fromJson(
          json['paginationResult'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => MusicData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusicResponseToJson(MusicResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paginationResult': instance.paginationResult,
      'data': instance.data,
    };

PaginationResult _$PaginationResultFromJson(Map<String, dynamic> json) =>
    PaginationResult(
      currentPage: (json['currentPage'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      numberOfPages: (json['numberOfPages'] as num).toInt(),
      next: (json['next'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationResultToJson(PaginationResult instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numberOfPages': instance.numberOfPages,
      'next': instance.next,
    };

MusicData _$MusicDataFromJson(Map<String, dynamic> json) => MusicData(
      id: json['_id'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      audio: json['audio'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$MusicDataToJson(MusicData instance) => <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'audio': instance.audio,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
