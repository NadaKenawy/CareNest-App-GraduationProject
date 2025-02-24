import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_white_noise_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class GetWhiteNoiseRepo {
  final ApiService _apiService;

  GetWhiteNoiseRepo(this._apiService);

  Future<ApiResult<WhiteNoiseResponse>> getWhiteNoise(String token) async {
    try {
      final response = await _apiService.getWhiteNoise(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
