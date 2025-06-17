import 'package:json_annotation/json_annotation.dart';
part 'create_report_request_body.g.dart';

@JsonSerializable()
class CreateReportRequestBody {
  final String title;
  final dynamic ratings;
  @JsonKey(name: 'user')
  final String userId;

  CreateReportRequestBody({
    required this.title,
    required this.ratings,
    required this.userId,
  });

  Map<String, dynamic> toJson() => _$CreateReportRequestBodyToJson(this);
}
