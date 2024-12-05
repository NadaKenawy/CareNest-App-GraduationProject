import 'package:json_annotation/json_annotation.dart';

part 'delete_all_notifications_response.g.dart';

@JsonSerializable()
class DeleteAllNotificationsResponse {
  final String message;

  DeleteAllNotificationsResponse({required this.message});

  factory DeleteAllNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAllNotificationsResponseFromJson(json);
}
