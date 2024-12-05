import 'package:json_annotation/json_annotation.dart';
part 'update_fcm_response.g.dart';
@JsonSerializable()
class UpdateFcmResponse {
  @JsonKey(name: 'data')
 String ? message;

  UpdateFcmResponse({
    this.message,
  });

  factory UpdateFcmResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmResponseFromJson(json);
  
}
  

