import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby/update_baby_request.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby/update_baby_response.dart';


class UpdateBabyRepo {
  final ApiService _apiService;

  UpdateBabyRepo(this._apiService);

  Future<ServerResult<UpdateBabyResponse>> updateBaby(
    UpdateBabyRequest updateBabyRequest,
    String token,
    String id,
  ) async {
    try {
      final response = await _apiService.updateBabyData(
        updateBabyRequest, 
        token, 
        id,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
