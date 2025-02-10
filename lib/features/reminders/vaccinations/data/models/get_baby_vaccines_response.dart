import 'package:json_annotation/json_annotation.dart';

part 'get_baby_vaccines_response.g.dart';

/// دالة مساعدة لتحويل حقل _id
String? idFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    // إذا كان json كائن يحتوي على مفتاح _id، نعيد القيمة الموجودة فيه
    return json['_id'] as String?;
  }
  // إذا كانت القيمة نصية مباشرة
  return json as String?;
}

@JsonSerializable()
class GetBabyVaccinesResponse {
  String? message;
  @JsonKey(name: 'data')
  List<BabyVaccineData>? vaccineData;

  GetBabyVaccinesResponse({this.message, this.vaccineData});

  factory GetBabyVaccinesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBabyVaccinesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBabyVaccinesResponseToJson(this);
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

  Map<String, dynamic> toJson() => _$BabyVaccineDataToJson(this);
}

@JsonSerializable()
class Vaccine {
  @JsonKey(name: '_id', fromJson: idFromJson)
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

  Map<String, dynamic> toJson() => _$VaccineToJson(this);
}
