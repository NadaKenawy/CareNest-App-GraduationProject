import 'package:json_annotation/json_annotation.dart';

part 'update_medication_schedule_response.g.dart';

@JsonSerializable()
class UpdateMedicationScheduleResponse {
  @JsonKey(name: 'data')
  MedicationScheduleData? medicationScheduleData;

  UpdateMedicationScheduleResponse({
    this.medicationScheduleData,
  });

  factory UpdateMedicationScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMedicationScheduleResponseFromJson(json);
}

@JsonSerializable()
class MedicationScheduleData {
  @JsonKey(name: '_id')
  String? id;
  String? medicationName;
  String? time; // HH:mm format
  String? begin; // ISO 8601 format
  String? end; // ISO 8601 format

  MedicationScheduleData({
    this.id,
    this.medicationName,
    this.time,
    this.begin,
    this.end,
  });

  factory MedicationScheduleData.fromJson(Map<String, dynamic> json) =>
      _$MedicationScheduleDataFromJson(json);
}
