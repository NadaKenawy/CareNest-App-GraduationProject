import 'dart:developer';

import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import '../models/get_baby_weight_growth_response.dart';

class GetBabyWeightGrowthRepo {
  final ApiService _apiService;

  GetBabyWeightGrowthRepo(this._apiService);

  Future<ApiResult<BabyWeightGrowthResponse>> getBabyWeightGrowth(
      String token, String babyid) async {
    try {
      final response = await _apiService.getWeightGrowthData(token, babyid);
      log('API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
