import 'package:json_annotation/json_annotation.dart';

part 'get_booked_appointments_response.g.dart';

@JsonSerializable()
class GetBookedAppointmentsResponse {
  final String status;
  final int results;
  final List<BookedAppointmentData> data;

  GetBookedAppointmentsResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory GetBookedAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookedAppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookedAppointmentsResponseToJson(this);
}

@JsonSerializable()
class BookedAppointmentData {
  @JsonKey(name: 'day')
  final AppointmentDay day;
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'orderPrice')
  final int appointmentPrice;
  final String status;
  final AppointmentDoctor doctor;

  BookedAppointmentData({
    required this.day,
    required this.id,
    required this.appointmentPrice,
    required this.status,
    required this.doctor,
  });

  factory BookedAppointmentData.fromJson(Map<String, dynamic> json) =>
      _$BookedAppointmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookedAppointmentDataToJson(this);
}

@JsonSerializable()
class AppointmentDay {
  final AppointmentTime time;
  final String type;
  final DateTime date;

  AppointmentDay({
    required this.time,
    required this.type,
    required this.date,
  });

  factory AppointmentDay.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDayFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDayToJson(this);
}

@JsonSerializable()
class AppointmentTime {
  final String startTime;

  AppointmentTime({
    required this.startTime,
  });

  factory AppointmentTime.fromJson(Map<String, dynamic> json) =>
      _$AppointmentTimeFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentTimeToJson(this);
}

@JsonSerializable()
class AppointmentDoctor {
  @JsonKey(name: '_id')
  final String id;
  final String? id2;

  AppointmentDoctor({
    required this.id,
    this.id2,
  });

  factory AppointmentDoctor.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDoctorToJson(this);
}
