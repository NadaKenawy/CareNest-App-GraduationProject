import 'package:json_annotation/json_annotation.dart';

part 'get_all_tips_of_mom_response.g.dart';

@JsonSerializable()
class GetAllTipsOfMomResponse {
  final int? results;
  final PaginationResult? paginationResult;
  final List<MomTipData>? data;

  GetAllTipsOfMomResponse({
    this.results,
    this.paginationResult,
    this.data,
  });

  factory GetAllTipsOfMomResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllTipsOfMomResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllTipsOfMomResponseToJson(this);
}

@JsonSerializable()
class PaginationResult {
  final int? currentPage;
  final int? limit;
  final int? numberOfPages;
  final int? next;

  PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
    this.next,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResultToJson(this);
}

@JsonSerializable()
class MomTipData {
  @JsonKey(name: "_id")
  final String? id;
  final String? target;
  final String? category;
  final String? header;
  final List<TipItem>? tip;
  final String? advice;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MomTipData({
    this.id,
    this.target,
    this.category,
    this.header,
    this.tip,
    this.advice,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory MomTipData.fromJson(Map<String, dynamic> json) =>
      _$MomTipDataFromJson(json);
  Map<String, dynamic> toJson() => _$MomTipDataToJson(this);
}

@JsonSerializable()
class TipItem {
  final String? title;
  final String? description;
  @JsonKey(name: "_id")
  final String? id;

  TipItem({
    this.title,
    this.description,
    this.id,
  });

  factory TipItem.fromJson(Map<String, dynamic> json) =>
      _$TipItemFromJson(json);
  Map<String, dynamic> toJson() => _$TipItemToJson(this);
}
