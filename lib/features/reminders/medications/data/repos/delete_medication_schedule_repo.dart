import 'package:care_nest/features/reminders/medications/data/models/delete_medication_schedule/delete_medication_schedule_response.dart';

import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/server_error_handler.dart';
import '../../../../../core/networking/server_result.dart';

class DeleteMedicationScheduleRepo {
  final ApiService _apiService;

  DeleteMedicationScheduleRepo(this._apiService);

  Future<ServerResult<DeleteMedicationScheduleResponse>>
      deleteMedicationSchedule(
          String token, String id, String scheduleId) async {
    try {
      final deleteMedicationScheduleResponse =
          await _apiService.deleteMedicationSchedule(token, id, scheduleId);
      return ServerResult.success(deleteMedicationScheduleResponse);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
