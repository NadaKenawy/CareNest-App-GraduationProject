import 'package:json_annotation/json_annotation.dart';
part 'get_doctors_request_body.g.dart';

@JsonSerializable()
class GetDoctorsRequestBody {
  @JsonKey(name: 'lng')
  double longitude;
  @JsonKey(name: 'lat')
  double latitude;

  GetDoctorsRequestBody({
    required this.longitude,
    required this.latitude,
  });

  factory GetDoctorsRequestBody.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorsRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorsRequestBodyToJson(this);
}
