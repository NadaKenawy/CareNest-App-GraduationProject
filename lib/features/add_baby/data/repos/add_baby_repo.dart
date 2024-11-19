import 'package:care_nest/features/add_baby/data/models/add_baby_request_body.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AddBabyRepo {
  final ApiService _apiService;

  AddBabyRepo(this._apiService);

  Future<ApiResult<AddBabyResponse>> addBaby(
      AddBabyRequestBody addBabyRequestBody, String token) async {
    try {
      final response = await _apiService.addNewBaby(
        addBabyRequestBody,
        token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
