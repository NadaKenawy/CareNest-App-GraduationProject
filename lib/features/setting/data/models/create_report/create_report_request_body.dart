import 'package:json_annotation/json_annotation.dart';
part 'create_report_request_body.g.dart';

@JsonSerializable()
class CreateReportRequestBody {
  final String title;
  final dynamic ratings;
 

  CreateReportRequestBody({
    required this.title,
    required this.ratings,
    
  });

  Map<String, dynamic> toJson() => _$CreateReportRequestBodyToJson(this);
}
