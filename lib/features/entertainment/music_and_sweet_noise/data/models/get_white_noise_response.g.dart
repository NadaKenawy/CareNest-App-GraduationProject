// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_white_noise_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhiteNoiseResponse _$WhiteNoiseResponseFromJson(Map<String, dynamic> json) =>
    WhiteNoiseResponse(
      results: (json['results'] as num).toInt(),
      paginationResult: PaginationResult.fromJson(
          json['paginationResult'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => WhiteNoiseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WhiteNoiseResponseToJson(WhiteNoiseResponse instance) =>
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

WhiteNoiseData _$WhiteNoiseDataFromJson(Map<String, dynamic> json) =>
    WhiteNoiseData(
      id: json['_id'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      audio: json['audio'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$WhiteNoiseDataToJson(WhiteNoiseData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'audio': instance.audio,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
