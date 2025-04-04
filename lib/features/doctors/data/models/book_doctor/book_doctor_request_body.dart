import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_request_body.g.dart';

@JsonSerializable()
class BookDoctorRequestBody {
  final String? promocode;
  final String doctor;
  final String day;
  final String startTime;
  final String date;

  BookDoctorRequestBody({
    this.promocode,
    required this.doctor,
    required this.day,
    required this.startTime,
    required this.date,
  });

  factory BookDoctorRequestBody.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BookDoctorRequestBodyToJson(this);
}
