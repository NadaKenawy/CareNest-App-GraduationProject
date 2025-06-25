import 'package:json_annotation/json_annotation.dart';
part 'update_pass_response.g.dart';

@JsonSerializable()
class UpdatePassResponse {
  final String msg;
  final String token;

  UpdatePassResponse({
    required this.msg,
    required this.token,
  });
  factory UpdatePassResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePassResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePassResponseToJson(this);
}
