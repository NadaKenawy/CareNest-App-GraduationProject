import 'package:json_annotation/json_annotation.dart';

part 'get_baby_vaccines_response.g.dart';

@JsonSerializable()
class GetBabyVaccinesResponse {
  String? message;
  @JsonKey(name: 'data')
  List<BabyVaccineData>? vaccineData;

  GetBabyVaccinesResponse({this.message, this.vaccineData});

  factory GetBabyVaccinesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBabyVaccinesResponseFromJson(json);
}

@JsonSerializable()
class BabyVaccineData {
  Vaccine? vaccine;
  bool? administered;
  bool? notificationSent;
  DateTime? date;

  BabyVaccineData({
    this.vaccine,
    this.administered,
    this.notificationSent,
    this.date,
  });

  factory BabyVaccineData.fromJson(Map<String, dynamic> json) =>
      _$BabyVaccineDataFromJson(json);
}

@JsonSerializable()
class Vaccine {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  int? ageRequired;
  int? dose;
  String? vaccineType;
  String? description;
  bool? repeat;
  DateTime? createdAt;
  DateTime? updatedAt;

  Vaccine({
    this.id,
    this.name,
    this.ageRequired,
    this.dose,
    this.vaccineType,
    this.description,
    this.repeat,
    this.createdAt,
    this.updatedAt,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) =>
      _$VaccineFromJson(json);
}
