import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/doctors/data/models/book_doctor/book_doctor_request_body.dart';
import 'package:care_nest/features/doctors/data/models/book_doctor/book_doctor_response.dart';

class DoctorBookingRepo {
  final ApiService _apiService;

  DoctorBookingRepo(this._apiService);

  Future<ServerResult<BookDoctorResponse>> bookDoctorAppointment(
    BookDoctorRequestBody requestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.bookDoctor(
        requestBody,
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
