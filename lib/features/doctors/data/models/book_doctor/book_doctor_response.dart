import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_response.g.dart';

@JsonSerializable()
class BookDoctorResponse {
  final String? status;
  final DoctorBookingData? data;

  BookDoctorResponse({
    this.status,
    this.data,
  });

  factory BookDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookDoctorResponseToJson(this);
}

@JsonSerializable()
class DoctorBookingData {
  final String? user;
  final num? orderPrice;
  final String? status;
  final String? doctor;
  final BookingDayData? day;
  @JsonKey(name: '_id')
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  DoctorBookingData({
    this.user,
    this.orderPrice,
    this.status,
    this.doctor,
    this.day,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
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
