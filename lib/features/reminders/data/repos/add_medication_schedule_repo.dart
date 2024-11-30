import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/reminders/data/models/add_medication_schedule_request_body.dart';
import 'package:care_nest/features/reminders/data/models/add_medication_schedule_response.dart';
import '../../../../core/networking/api_service.dart';

class AddMedicationScheduleRepo {
  final ApiService _apiService;

  AddMedicationScheduleRepo(this._apiService);

  Future<ApiResult<AddMedicationScheduleResponse>> addMedicationSchedule(
      AddMedicationScheduleRequestBody medicationScheduleRequestBody,
      String babyId,
      String token) async {
    try {
      final response = await _apiService.addMedicationSchedule(
        babyId,
        medicationScheduleRequestBody,
        token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
