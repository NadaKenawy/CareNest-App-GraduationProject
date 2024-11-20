import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_response.dart';

class VerifyAccountRepo {
  final ApiService _apiService;

  VerifyAccountRepo(this._apiService);

  Future<ApiResult<VerifyAccountResponse>> verify(
      VerifyAccountRequestBody verifyAccountRequestBody, String token) async {
    try {
      final response = await _apiService.verifyAccount(
        verifyAccountRequestBody,
        token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
