// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_tips_of_baby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTipsOfBabyResponse _$GetAllTipsOfBabyResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllTipsOfBabyResponse(
      results: (json['results'] as num?)?.toInt(),
      paginationResult: json['paginationResult'] == null
          ? null
          : PaginationResult.fromJson(
              json['paginationResult'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BabyTipData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTipsOfBabyResponseToJson(
        GetAllTipsOfBabyResponse instance) =>
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
      next: (json['next'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationResultToJson(PaginationResult instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numberOfPages': instance.numberOfPages,
      'next': instance.next,
    };

BabyTipData _$BabyTipDataFromJson(Map<String, dynamic> json) => BabyTipData(
      id: json['_id'] as String?,
      target: json['target'] as String?,
      month: (json['month'] as num?)?.toInt(),
      category: json['category'] as String?,
      header: json['header'] as String?,
      tip: (json['tip'] as List<dynamic>?)
          ?.map((e) => TipItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      advice: json['advice'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BabyTipDataToJson(BabyTipData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'target': instance.target,
      'month': instance.month,
      'category': instance.category,
      'header': instance.header,
      'tip': instance.tip,
      'advice': instance.advice,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

TipItem _$TipItemFromJson(Map<String, dynamic> json) => TipItem(
      title: json['title'] as String?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$TipItemToJson(TipItem instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      '_id': instance.id,
    };
