import 'package:json_annotation/json_annotation.dart';

part 'get_all_medication_schedule_response.g.dart';

@JsonSerializable()
class GetAllMedicationScheduleResponse {
  int? results;
  List<MedicationData>? data;

  GetAllMedicationScheduleResponse({
    this.results,
    this.data,
  });

  factory GetAllMedicationScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllMedicationScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMedicationScheduleResponseToJson(this);
}

@JsonSerializable()
class MedicationData {
  String? medicationName;
  String? time;
  DateTime? begin;
  DateTime? end;
  bool? notificationSent;
  String? id;

  MedicationData({
    this.medicationName,
    this.time,
    this.begin,
    this.end,
    this.notificationSent,
    this.id,
  });

  factory MedicationData.fromJson(Map<String, dynamic> json) =>
      _$MedicationDataFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationDataToJson(this);
}
