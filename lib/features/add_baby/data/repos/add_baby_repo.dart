import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby_request_body.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';

class AddBabyRepo {
  final ApiService _apiService;

  AddBabyRepo(this._apiService);

  Future<ServerResult<AddBabyResponse>> addBaby(
      AddBabyRequestBody addBabyRequestBody, String token) async {
    try {
      final response = await _apiService.addNewBaby(
        addBabyRequestBody,
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
