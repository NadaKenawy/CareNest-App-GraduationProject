import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_response.dart';

class VerifyPasswordRepo {
  final ApiService _apiService;

  VerifyPasswordRepo(this._apiService);

  Future<ApiResult<VerifyPasswordResponse>> forget(
      VerifyPasswordRequestBody verifyPasswordRequestBody, String token) async {
    try {
      final response = await _apiService.verifyPassword(
        verifyPasswordRequestBody,
        token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
