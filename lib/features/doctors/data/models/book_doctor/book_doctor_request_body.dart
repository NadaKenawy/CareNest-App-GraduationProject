import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_request_body.g.dart';

@JsonSerializable()
class PromoCode {
  final String code;
  final DateTime? expireAt;
  final double? value;

  PromoCode({
    required this.code,
    this.expireAt,
    this.value,
  });

  factory PromoCode.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeFromJson(json);

  Map<String, dynamic> toJson() => _$PromoCodeToJson(this);
}

@JsonSerializable()
class BookDoctorRequestBody {
  final List<PromoCode>? promocodes;
  final String doctor;
  final String day;
  final String startTime;
  final String date;

  BookDoctorRequestBody({
    this.promocodes,
    required this.doctor,
    required this.day,
    required this.startTime,
    required this.date,
  });

  factory BookDoctorRequestBody.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BookDoctorRequestBodyToJson(this);
}
