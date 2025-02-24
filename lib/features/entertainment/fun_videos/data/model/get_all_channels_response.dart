import 'package:json_annotation/json_annotation.dart';

part 'get_all_channels_response.g.dart';

@JsonSerializable()
class GetAllChannelsResponse {
  final int? results;
  final PaginationResult? paginationResult;
  final List<ChannelData>? data;

  GetAllChannelsResponse({
    this.results,
    this.paginationResult,
    this.data,
  });

  factory GetAllChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllChannelsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllChannelsResponseToJson(this);
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
class ChannelData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? logo;
  final String? url;
  final List<ChannelVideo>? videos;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChannelData({
    this.id,
    this.name,
    this.logo,
    this.url,
    this.videos,
    this.createdAt,
    this.updatedAt,
  });

  factory ChannelData.fromJson(Map<String, dynamic> json) =>
      _$ChannelDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelDataToJson(this);
}

@JsonSerializable()
class ChannelVideo {
  final String? name;
  final String? url;
  @JsonKey(name: "_id")
  final String? id;

  ChannelVideo({
    this.name,
    this.url,
    this.id,
  });

  factory ChannelVideo.fromJson(Map<String, dynamic> json) =>
      _$ChannelVideoFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelVideoToJson(this);
}
