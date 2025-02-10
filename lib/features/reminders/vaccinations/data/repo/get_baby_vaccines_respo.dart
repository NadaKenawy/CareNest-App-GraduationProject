import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
import 'package:hive/hive.dart';

class GetBabyVaccinesRepo {
  final ApiService _apiService;
  final Box<GetBabyVaccinesResponse> _vaccinesBox;
  GetBabyVaccinesRepo(this._apiService, this._vaccinesBox);

  Future<ServerResult<GetBabyVaccinesResponse>> getBabyVaccines(
      String token, String babyId) async {
    try {
      final cachedResponse = _vaccinesBox.get(babyId);
      if (cachedResponse != null) {
        return ServerResult.success(cachedResponse);
      }
      final response = await _apiService.getBabyVaccines(
        token,
        babyId,
      );
      await _vaccinesBox.put(babyId, response);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }

  GetBabyVaccinesResponse? getCachedBabyVaccines(String babyId) {
    return _vaccinesBox.get(babyId);
  }
}
