import 'dart:developer';

import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';

import '../models/get_baby_growth_response.dart';

class GetBabyHeightGrowthRepo {
  final ApiService _apiService;

  GetBabyHeightGrowthRepo(this._apiService);

  Future<ApiResult<BabyHeightGrowthResponse>> getBabyHeightGrowth(
      String token, String babyid) async {
    try {
      final response = await _apiService.getHeightGrowthData(token, babyid);
      log('API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
