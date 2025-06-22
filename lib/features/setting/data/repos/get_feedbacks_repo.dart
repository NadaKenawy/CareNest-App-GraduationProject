import 'package:care_nest/features/setting/data/models/get_feedbacks/get_feedbacks_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class GetFeedbacksRepo {
  final ApiService _apiService;
  GetFeedbacksRepo(this._apiService);

  Future<ApiResult<GetFeedbacksResponse>> getFeedbacks(String token) async {
    try {
      final response = await _apiService.getFeedbacks(token);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
