import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'get_baby_vaccines_response.g.dart';

String? idFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    return json['_id'] as String?;
  }
  return json as String?;
}

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true) 
class GetBabyVaccinesResponse {
  @HiveField(0)
  String? message;

  @HiveField(1)
  @JsonKey(name: 'data')
  List<BabyVaccineData>? vaccineData;

  GetBabyVaccinesResponse({this.message, this.vaccineData});

  factory GetBabyVaccinesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBabyVaccinesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBabyVaccinesResponseToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class BabyVaccineData {
  @HiveField(0)
  Vaccine? vaccine;

  @HiveField(1)
  bool? administered;

  @HiveField(2)
  bool? notificationSent;

  @HiveField(3)
  DateTime? date;

  BabyVaccineData({
    this.vaccine,
    this.administered,
    this.notificationSent,
    this.date,
  });

  factory BabyVaccineData.fromJson(Map<String, dynamic> json) =>
      _$BabyVaccineDataFromJson(json);

  Map<String, dynamic> toJson() => _$BabyVaccineDataToJson(this);
}

@HiveType(typeId: 0)
@JsonSerializable()
class Vaccine {
  @HiveField(0)
  @JsonKey(name: '_id', fromJson: idFromJson)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  int? ageRequired;

  @HiveField(3)
  int? dose;

  @HiveField(4)
  String? vaccineType;

  @HiveField(5)
  String? description;

  @HiveField(6)
  bool? repeat;

  @HiveField(7)
  DateTime? createdAt;

  @HiveField(8)
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

  Map<String, dynamic> toJson() => _$VaccineToJson(this);
}
