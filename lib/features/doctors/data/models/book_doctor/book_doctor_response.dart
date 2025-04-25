import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_response.g.dart';

@JsonSerializable()
class BookDoctorResponse {
  final String? status;
  final String? message;
  final DoctorBookingData? data;

  BookDoctorResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BookDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookDoctorResponseToJson(this);
}

@JsonSerializable()
class DoctorBookingData {
  @JsonKey(name: 'id')
  final String? id;
  final String? appointmentDateTime;
  final BookingDayData? day;
  final String? status;
  final bool? isExpired;
  final num? orderPrice;

  DoctorBookingData({
    this.id,
    this.appointmentDateTime,
    this.day,
    this.status,
    this.isExpired,
    this.orderPrice,
  });

  factory DoctorBookingData.fromJson(Map<String, dynamic> json) =>
      _$DoctorBookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorBookingDataToJson(this);
}

@JsonSerializable()
class BookingDayData {
  final String? type;
  final BookingTimeData? time;
  final String? date;

  BookingDayData({
    this.type,
    this.time,
    this.date,
  });

  factory BookingDayData.fromJson(Map<String, dynamic> json) =>
      _$BookingDayDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDayDataToJson(this);
}

@JsonSerializable()
class BookingTimeData {
  final String? startTime;

  BookingTimeData({this.startTime});

  factory BookingTimeData.fromJson(Map<String, dynamic> json) =>
      _$BookingTimeDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingTimeDataToJson(this);
}
