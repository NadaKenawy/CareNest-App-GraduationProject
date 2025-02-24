import 'package:json_annotation/json_annotation.dart';
part 'get_white_noise_response.g.dart';

@JsonSerializable()
class WhiteNoiseResponse {
  final int results;
  final PaginationResult paginationResult;
  final List<WhiteNoiseData> data;

  WhiteNoiseResponse({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory WhiteNoiseResponse.fromJson(Map<String, dynamic> json) =>
      _$WhiteNoiseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WhiteNoiseResponseToJson(this);
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
class WhiteNoiseData {
  @JsonKey(name: "_id")
  final String id;
  final String category;
  final String name;
  final String audio;
  final String createdAt;
  final String updatedAt;

  WhiteNoiseData({
    required this.id,
    required this.category,
    required this.name,
    required this.audio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WhiteNoiseData.fromJson(Map<String, dynamic> json) =>
      _$WhiteNoiseDataFromJson(json);
  Map<String, dynamic> toJson() => _$WhiteNoiseDataToJson(this);
}
