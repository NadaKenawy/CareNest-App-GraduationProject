import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/features/entertainment/data/models/get_all_stories/get_all_stories_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';

class GetAllStoriesRepo {
  final ApiService _apiService;

  GetAllStoriesRepo(this._apiService);

  Future<ApiResult<GetAllStoriesResponse>> getAllStories(String token) async {
    try {
      final response = await _apiService.getAllStories(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
