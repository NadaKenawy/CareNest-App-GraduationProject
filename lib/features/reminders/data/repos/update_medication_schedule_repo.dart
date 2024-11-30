import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/reminders/data/models/update_medication_schedule_request.dart';
import 'package:care_nest/features/reminders/data/models/update_medication_schedule_response.dart';


class UpdateMedicationScheduleRepo {
  final ApiService _apiService;

  UpdateMedicationScheduleRepo(this._apiService);

  Future<ServerResult<UpdateMedicationScheduleResponse>> updateMedicationSchedule({
    required String babyId,
    required String scheduleId,
    required String token,
    required UpdateMedicationScheduleRequest request,
  }) async {
    try {
      final response = await _apiService.updateMedicationSchedule(
        babyId,
        scheduleId,
        token,
        request,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
