import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/reminders/data/models/get_all_medication_schedule_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';

class GetAllMedicationScheduleRepo {
  final ApiService _apiService;

  GetAllMedicationScheduleRepo(this._apiService);

  Future<ApiResult<GetAllMedicationScheduleResponse>> getAllMedicationSchedule(
      String token, String id) async {
    try {
      final response = await _apiService.getAllMedicationSchedule(
        token,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
