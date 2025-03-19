import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/doctors/data/models/booked_appointments/get_booked_appointments_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class GetBookedAppointmentsRepo {
  final ApiService _apiService;

  GetBookedAppointmentsRepo(this._apiService);

  Future<ApiResult<GetBookedAppointmentsResponse>> getBookedAppointments(String token) async {
    try {
      final response = await _apiService.getBookedAppointments(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
