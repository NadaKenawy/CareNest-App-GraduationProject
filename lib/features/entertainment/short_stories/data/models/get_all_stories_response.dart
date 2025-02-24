import 'package:json_annotation/json_annotation.dart';

part 'get_all_stories_response.g.dart';

@JsonSerializable()
class GetAllStoriesResponse {
  final int? results;
  final PaginationResult? paginationResult;
  final List<StoryData>? data;

  GetAllStoriesResponse({
    this.results,
    this.paginationResult,
    this.data,
  });

  factory GetAllStoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllStoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllStoriesResponseToJson(this);
}

@JsonSerializable()
class PaginationResult {
  final int? currentPage;
  final int? limit;
  final int? numberOfPages;

  PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResultToJson(this);
}

@JsonSerializable()
class StoryData {
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final String? content;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StoryData({
    this.id,
    this.title,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory StoryData.fromJson(Map<String, dynamic> json) =>
      _$StoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$StoryDataToJson(this);
}
