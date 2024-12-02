import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_fcm_token_request_body.g.dart';

@JsonSerializable()
class UpdateFcmTokenRequestBody {
  final String fcmToken;

  UpdateFcmTokenRequestBody({
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => _$UpdateFcmTokenRequestBodyToJson(this);
}
