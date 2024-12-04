import 'package:json_annotation/json_annotation.dart';

part 'get_all_babies_medication_schedule_response.g.dart';

@JsonSerializable()
class GetAllBabiesMedicationScheduleResponse {
  int? results;
  List<BabiesMedicationData>? data;

  GetAllBabiesMedicationScheduleResponse({
    this.results,
    this.data,
  });

  factory GetAllBabiesMedicationScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllBabiesMedicationScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllBabiesMedicationScheduleResponseToJson(this);
}

@JsonSerializable()
class BabiesMedicationData {
  String? medicationName;
  String? time;
  DateTime? begin;
  DateTime? end;
  bool? notificationSent;
  String? id;

  BabiesMedicationData({
    this.medicationName,
    this.time,
    this.begin,
    this.end,
    this.notificationSent,
    this.id,
  });

  factory BabiesMedicationData.fromJson(Map<String, dynamic> json) =>
      _$BabiesMedicationDataFromJson(json);

  Map<String, dynamic> toJson() => _$BabiesMedicationDataToJson(this);
}
