// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tip_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTipDetailsResponse _$GetTipDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetTipDetailsResponse(
      data: TipDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTipDetailsResponseToJson(
        GetTipDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TipDetails _$TipDetailsFromJson(Map<String, dynamic> json) => TipDetails(
      id: json['_id'] as String,
      target: json['target'] as String,
      month: (json['month'] as num?)?.toInt() ?? 0,
      category: json['category'] as String,
      header: json['header'] as String,
      tip: (json['tip'] as List<dynamic>)
          .map((e) => TipItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      advice: json['advice'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$TipDetailsToJson(TipDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'target': instance.target,
      'month': instance.month,
      'category': instance.category,
      'header': instance.header,
      'tip': instance.tip,
      'advice': instance.advice,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

TipItem _$TipItemFromJson(Map<String, dynamic> json) => TipItem(
      title: json['title'] as String,
      description: json['description'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$TipItemToJson(TipItem instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      '_id': instance.id,
    };
