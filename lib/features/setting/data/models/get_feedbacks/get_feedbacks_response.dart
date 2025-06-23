import 'package:json_annotation/json_annotation.dart';
part 'get_feedbacks_response.g.dart';

@JsonSerializable()
class GetFeedbacksResponse {
  final List<FeedbackModel> feedbacks;
  final StatsModel stats;

  GetFeedbacksResponse({
    required this.feedbacks,
    required this.stats,
  });

  factory GetFeedbacksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFeedbacksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedbacksResponseToJson(this);
}

@JsonSerializable()
class FeedbackModel {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final UserModel user;
  final double ratings;
  final String createdAt;
  final String updatedAt;

  FeedbackModel({
    required this.id,
    required this.title,
    required this.user,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String id;
  final String firstName;
  final String lastName;
  final String ? image;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
     this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class StatsModel {
  final String averageRating;
  final String percentage;
  final int totalReports;

  StatsModel({
    required this.averageRating,
    required this.percentage,
    required this.totalReports,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatsModelToJson(this);
}
