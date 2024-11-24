import 'package:json_annotation/json_annotation.dart';

part 'delete_baby_response.g.dart';

@JsonSerializable()
class DeleteBabyResponse {
  final String? message;

  DeleteBabyResponse({
    this.message,
  });

  factory DeleteBabyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBabyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteBabyResponseToJson(this);
}