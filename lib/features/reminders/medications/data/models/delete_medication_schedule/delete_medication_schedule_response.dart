import 'package:json_annotation/json_annotation.dart';

part 'delete_medication_schedule_response.g.dart';

@JsonSerializable()
class DeleteMedicationScheduleResponse {
  final String? message;

  DeleteMedicationScheduleResponse({
    this.message,
  });

  factory DeleteMedicationScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMedicationScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMedicationScheduleResponseToJson(this);
}