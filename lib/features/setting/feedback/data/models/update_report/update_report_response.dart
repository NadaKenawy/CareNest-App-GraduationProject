import 'package:json_annotation/json_annotation.dart';
part 'update_report_response.g.dart';

@JsonSerializable()
class UpdateReportResponse {
  final ReviewData data;

  UpdateReportResponse({required this.data});

  factory UpdateReportResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateReportResponseToJson(this);
}

@JsonSerializable()
class ReviewData {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final dynamic ratings;
  final String user;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  ReviewData({
    required this.title,
    required this.ratings,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);
}
