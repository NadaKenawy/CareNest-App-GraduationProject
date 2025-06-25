import 'package:json_annotation/json_annotation.dart';

part 'get_all_notifications_response.g.dart';

@JsonSerializable()
class GetAllNotificationsResponse {
  int? results;
  @JsonKey(name: 'data')
  List<NotificationData>? notificationsData;

  GetAllNotificationsResponse({
    this.results,
    this.notificationsData,
  });

  factory GetAllNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationsResponseFromJson(json);
}

@JsonSerializable()
class NotificationData {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? message;
  DateTime? createdAt;
  Recipient? recipient;

  NotificationData({
    this.id,
    this.title,
    this.message,
    this.createdAt,
    this.recipient,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@JsonSerializable()
class Recipient {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'Email')
  String? email;
  String? firstName;
  String? lastName;

  Recipient({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);
}
