import 'package:json_annotation/json_annotation.dart';

part 'book_doctor_request_body.g.dart';

@JsonSerializable()
class BookDoctorRequestBody {
  final String? promocode;
  final String doctor;
  final String appointmentDateTime;

  BookDoctorRequestBody({
    this.promocode,
    required this.doctor,
    required this.appointmentDateTime,
  });

  factory BookDoctorRequestBody.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BookDoctorRequestBodyToJson(this);
}