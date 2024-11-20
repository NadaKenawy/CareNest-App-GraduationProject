import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_email_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_response.dart';

class ForgetPassRepo {
  final ApiService _apiService;

  ForgetPassRepo(this._apiService);

  Future<ApiResult<ForgetPassResponse>> forget(
      ForgetPassEmailRequestBody forgetPassEmailRequestBody) async {
    try {
      final response =
          await _apiService.forgetPassword(forgetPassEmailRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
