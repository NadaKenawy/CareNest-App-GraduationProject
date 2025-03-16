import 'package:json_annotation/json_annotation.dart';

part 'get_hospitals_response.g.dart';

@JsonSerializable()
class GetHospitalsResponse {
  int? totalResults;
  List<HospitalData>? data;

  GetHospitalsResponse({
    this.totalResults,
    this.data,
  });

  factory GetHospitalsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHospitalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHospitalsResponseToJson(this);
}

@JsonSerializable()
class HospitalData {
  String? title;
  String? phone;
  int? distance;
  Position? position;
  List<Position>? access;
  String? district;
  String? label;
  String? categoryName;

  HospitalData({
    this.title,
    this.phone,
    this.distance,
    this.position,
    this.access,
    this.district,
    this.label,
    this.categoryName,
  });

  factory HospitalData.fromJson(Map<String, dynamic> json) =>
      _$HospitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalDataToJson(this);
}

@JsonSerializable()
class Position {
  double? lat;
  double? lng;

  Position({
    this.lat,
    this.lng,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
