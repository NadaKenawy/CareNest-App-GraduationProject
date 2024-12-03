import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/reminders/data/models/get_all_babies_medication_schedule/get_all_babies_medication_schedule_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';

class GetAllBabiesMedicationScheduleRepo {
  final ApiService _apiService;

  GetAllBabiesMedicationScheduleRepo(this._apiService);

  Future<ApiResult<GetAllBabieslMedicationScheduleResponse>> getAllBabiesMedicationSchedule(
      String token) async {
    try {
      final response = await _apiService.getAllBabiesMedicationSchedule(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
