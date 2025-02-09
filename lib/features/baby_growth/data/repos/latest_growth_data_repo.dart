import 'dart:developer';
import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/baby_growth/data/models/latest_growth_data/latest_growth_data_response.dart';

class LatestGrowthDataRepo {
  final ApiService _apiService;

  LatestGrowthDataRepo(this._apiService);
  Future<ApiResult<LatestGrowthDataResponse>> getLatestGrowthData(
      String token, String id) async {
    try {
      final response = await _apiService.getLatestGrowthData(token, id);
      log('API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
