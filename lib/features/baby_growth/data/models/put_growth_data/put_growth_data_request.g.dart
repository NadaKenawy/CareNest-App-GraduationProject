// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_growth_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutGrowthDataRequest _$PutGrowthDataRequestFromJson(
        Map<String, dynamic> json) =>
    PutGrowthDataRequest(
      heightEntry: json['heightEntry'] as num?,
      weightEntry: json['weightEntry'] as num?,
    );

Map<String, dynamic> _$PutGrowthDataRequestToJson(
        PutGrowthDataRequest instance) =>
    <String, dynamic>{
      'heightEntry': instance.heightEntry,
      'weightEntry': instance.weightEntry,
    };
