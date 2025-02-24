import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_music_response.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_service.dart';

class GetMusicRepo {
  final ApiService _apiService;

  GetMusicRepo(this._apiService);

  Future<ApiResult<MusicResponse>> getMusic(String token) async {
    try {
      final response = await _apiService.getMusic(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
