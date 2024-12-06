import 'package:json_annotation/json_annotation.dart';

part 'delete_all_notifications_response.g.dart';

@JsonSerializable()
class DeleteAllNotificationsResponse {
  DeleteAllNotificationsResponse();

  factory DeleteAllNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAllNotificationsResponseFromJson(json);
}
