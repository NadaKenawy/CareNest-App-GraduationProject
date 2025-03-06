import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';


class GetBabyVaccinesRepo {
  final ApiService _apiService;
  

  GetBabyVaccinesRepo(this._apiService,);

  Future<ServerResult<GetBabyVaccinesResponse>> getBabyVaccines(
      String token, String babyId) async {
    try {
     

      final response = await _apiService.getBabyVaccines(token, babyId);
     
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }

 
 
}
