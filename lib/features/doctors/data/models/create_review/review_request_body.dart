import 'package:json_annotation/json_annotation.dart';

part 'review_request_body.g.dart';

@JsonSerializable()
class ReviewRequestBody {
  final String doctor;
  final int ratings;  
  final String? user;

  ReviewRequestBody({
    required this.doctor,
    required this.ratings,
    this.user,
  });

  factory ReviewRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestBodyToJson(this);
}
