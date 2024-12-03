import 'package:json_annotation/json_annotation.dart';

part 'update_medication_schedule_request.g.dart';

@JsonSerializable()
class UpdateMedicationScheduleRequest {
  final String? medicationName;
  final String? time; 
  final String? begin; 
  final String? end; 

  UpdateMedicationScheduleRequest({
    this.medicationName,
    this.time,
    this.begin,
    this.end,
  });

  Map<String, dynamic> toJson() => _$UpdateMedicationScheduleRequestToJson(this);

  factory UpdateMedicationScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMedicationScheduleRequestFromJson(json);
}
