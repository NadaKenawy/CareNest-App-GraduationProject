import 'package:json_annotation/json_annotation.dart';

part 'get_all_tips_of_baby_response.g.dart';

@JsonSerializable()
class GetAllTipsOfBabyResponse {
  final int? results;
  final PaginationResult? paginationResult;
  final List<BabyTipData>? data;

  GetAllTipsOfBabyResponse({
    this.results,
    this.paginationResult,
    this.data,
  });

  factory GetAllTipsOfBabyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllTipsOfBabyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllTipsOfBabyResponseToJson(this);
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
class BabyTipData {
  @JsonKey(name: "_id")
  final String? id;
  final String? target;
  final int? month;
  final String? category;
  final String? header;
  final List<TipItem>? tip;
  final String? advice;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BabyTipData({
    this.id,
    this.target,
    this.month,
    this.category,
    this.header,
    this.tip,
    this.advice,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BabyTipData.fromJson(Map<String, dynamic> json) =>
      _$BabyTipDataFromJson(json);
  Map<String, dynamic> toJson() => _$BabyTipDataToJson(this);
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
