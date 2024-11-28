import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/reminders/data/models/add_medication_schedule_request_body.dart';
import 'package:care_nest/features/reminders/data/models/add_medication_schedule_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';

class AddMedicationScheduleRepo {
  final ApiService _apiService;

  AddMedicationScheduleRepo(this._apiService);

  Future<ServerResult<AddMedicationScheduleResponse>> addMedicationSchedule(
      AddMedicationScheduleRequestBody medicationScheduleRequestBody, 
      String babyId,
      String token) async {
    try {
      final response = await _apiService.addMedicationSchedule(
        babyId, 
        medicationScheduleRequestBody, 
        token, 
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
