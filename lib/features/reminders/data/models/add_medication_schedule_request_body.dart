import 'package:json_annotation/json_annotation.dart';
part 'add_medication_schedule_request_body.g.dart';

@JsonSerializable()
class AddMedicationScheduleRequestBody {
  final String medicationName;
  final String time;
  final String begin; 
  final String end; 

  AddMedicationScheduleRequestBody({
    required this.medicationName,
    required this.time,
    required this.begin,
    required this.end,
  });

  Map<String, dynamic> toJson() => _$AddMedicationScheduleRequestBodyToJson(this);
}
