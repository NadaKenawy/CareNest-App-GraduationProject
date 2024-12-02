import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/fcm/data/models/update_fcm_response.dart';
import 'package:care_nest/features/fcm/data/models/update_fcm_token_request_body.dart';

import '../../../../core/networking/api_error_handler.dart';

class UpdateFcmRepo {
  final ApiService _apiService;

  UpdateFcmRepo(this._apiService);

  Future<ApiResult<UpdateFcmResponse>> updateFcm(
    UpdateFcmTokenRequestBody updateFcmTokenRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.updateFcmToken(
        token,
        updateFcmTokenRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
