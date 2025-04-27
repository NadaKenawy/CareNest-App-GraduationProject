import 'package:json_annotation/json_annotation.dart';

part 'get_community_messages_response.g.dart';

@JsonSerializable()
class GetCommunityMessagesResponse {
  List<CommunityMessage>? messages;

  GetCommunityMessagesResponse({
    this.messages,
  });

  factory GetCommunityMessagesResponse.fromJson(List<dynamic> json) =>
      GetCommunityMessagesResponse(
        messages: json.map((e) => CommunityMessage.fromJson(e as Map<String, dynamic>)).toList(),
      );
  Map<String, dynamic> toJson() => {
        'messages': messages?.map((e) => e.toJson()).toList(),
      };
}

@JsonSerializable()
class CommunityMessage {
  String? id;
  String? senderId;
  String? fullName;
  String? userImage;
  String? message;
  List<String>? images;
  String? mediaUrl;
  String? mediaType;
  String? messageType;

  /// يستخدم إما timestamp كـ int أو كـ object فيه _seconds و _nanoseconds
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? timestamp;

  CommunityMessage({
    this.id,
    this.senderId,
    this.fullName,
    this.userImage,
    this.message,
    this.images,
    this.mediaUrl,
    this.mediaType,
    this.messageType,
    this.timestamp,
  });

  factory CommunityMessage.fromJson(Map<String, dynamic> json) =>
      _$CommunityMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityMessageToJson(this);

  static DateTime? _timestampFromJson(dynamic value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    } else if (value is Map<String, dynamic> &&
        value.containsKey('_seconds') &&
        value.containsKey('_nanoseconds')) {
      return DateTime.fromMillisecondsSinceEpoch(value['_seconds'] * 1000);
    }
    return null;
  }

  static dynamic _timestampToJson(DateTime? time) {
    return time?.millisecondsSinceEpoch;
  }
}
