import 'package:json_annotation/json_annotation.dart';

part 'delete_notification_response.g.dart';

@JsonSerializable()
class DeleteNotificationResponse {
  DeleteNotificationResponse();

  factory DeleteNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNotificationResponseFromJson(json);
}
