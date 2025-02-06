import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';

import '../models/get_baby_growth_response.dart';

class GetBabyGrowthHeightRepo {
  final ApiService _apiService;

  GetBabyGrowthHeightRepo(this._apiService);

  Future<ApiResult<BabyGrowthHeightResponse>> getBabyGrowthHeight(
      String token, String babyid) async {
    try {
      final response = await _apiService.getGrowthData(token, babyid);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
