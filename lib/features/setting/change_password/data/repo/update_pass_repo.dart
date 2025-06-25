import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/update_pass_request_body.dart';
import '../models/update_pass_response.dart';

class UpdatePassRepo {
  final ApiService _apiService;

  UpdatePassRepo(this._apiService);

  Future<ApiResult<UpdatePassResponse>> updatePassword(
      UpdatePassRequestBody updatePassRequestBody, String token) async {
    try {
      final response =
          await _apiService.updatePassword(token, updatePassRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
