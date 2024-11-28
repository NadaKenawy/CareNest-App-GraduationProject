import 'package:care_nest/features/reminders/data/models/get_all_medication_schedule_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class GetAllMedicationScheduleRepo {
  final ApiService _apiService;

  GetAllMedicationScheduleRepo(this._apiService);

  Future<ServerResult<GetAllMedicationScheduleResponse>>
      getAllMedicationSchedule(String token, String id) async {
    try {
      final response = await _apiService.getAllMedicationSchedule(
        token,
        id,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
