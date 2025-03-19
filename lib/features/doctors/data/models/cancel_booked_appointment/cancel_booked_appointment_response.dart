import 'package:care_nest/features/doctors/data/models/booked_appointments/get_booked_appointments_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cancel_booked_appointment_response.g.dart';

@JsonSerializable()
class CancelBookedAppointmentResponse {
  final String status;
  final CancelBookedAppointmentData data;

  CancelBookedAppointmentResponse({
    required this.status,
    required this.data,
  });

  factory CancelBookedAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelBookedAppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$CancelBookedAppointmentResponseToJson(this);
}

@JsonSerializable()
class CancelBookedAppointmentData {
  final AppointmentDay day;
  final bool notificationSent;
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final int orderPrice;
  final String status;
  final String doctor;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  CancelBookedAppointmentData({
    required this.day,
    required this.notificationSent,
    required this.id,
    required this.user,
    required this.orderPrice,
    required this.status,
    required this.doctor,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CancelBookedAppointmentData.fromJson(Map<String, dynamic> json) =>
      _$CancelBookedAppointmentDataFromJson(json);
  Map<String, dynamic> toJson() => _$CancelBookedAppointmentDataToJson(this);
}
