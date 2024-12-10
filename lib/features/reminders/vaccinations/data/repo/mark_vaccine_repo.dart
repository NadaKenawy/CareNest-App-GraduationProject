import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/mark_vaccine_response.dart';
class MarkVaccineRepo {
  final ApiService _apiService;

  MarkVaccineRepo(this._apiService);

  Future<ServerResult<MarkVaccineResponse>> markVaccine(
      String token, String babyId, String vaccineId) async {
    try {
      final response = await _apiService.markVaccine(
        token,
        babyId,
        vaccineId,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
