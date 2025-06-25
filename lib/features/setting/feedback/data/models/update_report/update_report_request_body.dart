import 'package:json_annotation/json_annotation.dart';
part 'update_report_request_body.g.dart';

@JsonSerializable()
class UpdateReportRequestBody {
  final String title;
  final dynamic ratings;

  UpdateReportRequestBody({
    required this.title,
    required this.ratings,
  });

  Map<String, dynamic> toJson() => _$UpdateReportRequestBodyToJson(this);
}
