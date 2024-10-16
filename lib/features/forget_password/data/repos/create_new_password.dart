import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/forget_password/data/models/create_new_password_model/create_new_password_request_body.dart';

class CreateNewPasswordRepo {
  final ApiService _apiService;

  CreateNewPasswordRepo(this._apiService);

  /// Creates a new password for the user.
  ///
  /// Returns a [ApiResult] indicating the success or failure of the operation.
  Future<ApiResult<void>> createNewPassword(
    CreateNewPasswordRequestBody createNewPasswordRequestBody,
    String token,
  ) async {
    try {
      await _apiService.createNewPassword(token, createNewPasswordRequestBody);
      return const ApiResult.success(null); 
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
