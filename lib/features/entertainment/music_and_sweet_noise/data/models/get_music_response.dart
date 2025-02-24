import 'package:json_annotation/json_annotation.dart';

part 'get_music_response.g.dart';

@JsonSerializable()
class MusicResponse {
  final int results;
  final PaginationResult paginationResult;
  final List<MusicData> data;

  MusicResponse({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory MusicResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MusicResponseToJson(this);
}

@JsonSerializable()
class PaginationResult {
  final int currentPage;
  final int limit;
  final int numberOfPages;
  final int? next;

  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
    this.next,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResultToJson(this);
}

@JsonSerializable()
class MusicData {
  @JsonKey(name: "_id")
  final String id;
  final String category;
  final String name;
  final String audio;
  final String createdAt;
  final String updatedAt;

  MusicData({
    required this.id,
    required this.category,
    required this.name,
    required this.audio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MusicData.fromJson(Map<String, dynamic> json) =>
      _$MusicDataFromJson(json);
  Map<String, dynamic> toJson() => _$MusicDataToJson(this);
}
