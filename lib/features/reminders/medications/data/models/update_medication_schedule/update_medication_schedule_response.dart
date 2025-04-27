import 'package:json_annotation/json_annotation.dart';

part 'update_medication_schedule_response.g.dart';

@JsonSerializable()
class UpdateMedicationScheduleResponse {
  @JsonKey(name: 'msg')
  String? message;

  @JsonKey(name: 'data')
  BabyData? babyData;

  @JsonKey(name: 'medicationSchedule')
  List<MedicationData>? medicationSchedule;

  UpdateMedicationScheduleResponse({
    this.message,
    this.babyData,
    this.medicationSchedule,
  });

  factory UpdateMedicationScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMedicationScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateMedicationScheduleResponseToJson(this);
}

@JsonSerializable()
class BabyData {
  @JsonKey(name: '_id')
  String? id;
  String? name;

  BabyData({
    this.id,
    this.name,
  });

  factory BabyData.fromJson(Map<String, dynamic> json) =>
      _$BabyDataFromJson(json);

  Map<String, dynamic> toJson() => _$BabyDataToJson(this);
}

@JsonSerializable()
class MedicationData {
  @JsonKey(name: 'medicationName')
  String? medicationName;

  String? time;

  @JsonKey(name: 'begin')
  DateTime? begin;

  @JsonKey(name: 'end')
  DateTime? end;

  @JsonKey(name: 'notificationSent')
  bool? notificationSent;

  @JsonKey(name: '_id')
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
