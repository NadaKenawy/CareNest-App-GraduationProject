
import 'package:json_annotation/json_annotation.dart';
part 'add_medication_schedule_response.g.dart';

@JsonSerializable()
class AddMedicationScheduleResponse {
  final String msg;
  final List<MedicationScheduleData> data;

  AddMedicationScheduleResponse({
    required this.msg,
    required this.data,
  });

  factory AddMedicationScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$AddMedicationScheduleResponseFromJson(json);
}

@JsonSerializable()
class MedicationScheduleData {
  final String medicationName;
  final String time;
  final String begin;
  final String end;
  final bool notificationSent;
  final String id;

  MedicationScheduleData({
    required this.medicationName,
    required this.time,
    required this.begin,
    required this.end,
    required this.notificationSent,
    required this.id,
  });

  factory MedicationScheduleData.fromJson(Map<String, dynamic> json) =>
      _$MedicationScheduleDataFromJson(json);
}
