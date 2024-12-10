import 'package:json_annotation/json_annotation.dart';

part 'mark_vaccine_response.g.dart';

@JsonSerializable()
class MarkVaccineResponse {
  String? msg;
  @JsonKey(name: 'data')
  List<VaccineAdministeredData>? vaccineData;

  MarkVaccineResponse({this.msg, this.vaccineData});

  factory MarkVaccineResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkVaccineResponseFromJson(json);
}

@JsonSerializable()
class VaccineAdministeredData {
  String? vaccineId;
  bool? administered;
  DateTime? date;

  VaccineAdministeredData({
    this.vaccineId,
    this.administered,
    this.date,
  });

  factory VaccineAdministeredData.fromJson(Map<String, dynamic> json) =>
      _$VaccineAdministeredDataFromJson(json);
}
