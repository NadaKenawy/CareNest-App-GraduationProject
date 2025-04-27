import 'package:json_annotation/json_annotation.dart';

part 'delete_message_response.g.dart';

@JsonSerializable()
class DeleteMessageResponse {
  final bool success;
  final String message;

  DeleteMessageResponse({
    required this.success,
    required this.message,
  });

  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMessageResponseToJson(this);
}
