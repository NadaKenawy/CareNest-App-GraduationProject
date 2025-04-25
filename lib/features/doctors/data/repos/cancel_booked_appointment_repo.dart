import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/doctors/data/models/cancel_booked_appointment/cancel_booked_appointment_response.dart';

class CancelBookedAppointmentRepo {
  final ApiService _apiService;

  CancelBookedAppointmentRepo(this._apiService);

  Future<ServerResult<CancelBookedAppointmentResponse>> cancelBookedAppointment(
      String token, String id) async {
    try {
      final response = await _apiService.cancelBookedAppointment(token, id);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
