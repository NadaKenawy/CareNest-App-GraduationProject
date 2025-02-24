import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/entertainment/fun_videos/data/model/get_all_channels_response.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_service.dart';

class GetAllChannelsRepo {
  final ApiService _apiService;

  GetAllChannelsRepo(this._apiService);

  Future<ApiResult<GetAllChannelsResponse>> getAllChannels(String token) async {
    try {
      final response = await _apiService.getAllChannels(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
