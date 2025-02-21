import 'dart:developer';
import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/tips/data/models/get_tip_details_response.dart';

class GetTipDetailsRepo {
  final ApiService _apiService;

  GetTipDetailsRepo(this._apiService);

  Future<ApiResult<GetTipDetailsResponse>> getTipDetails(String token, String tipId) async {
    try {
      final response = await _apiService.getTipDetails(token, tipId);
      log('Tip Details API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
