import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_request_body.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_response.dart';

class DoctorReviewRepo {
  final ApiService _apiService;

  DoctorReviewRepo(this._apiService);

  Future<ServerResult<ReviewResponse>> submitReview(
    ReviewRequestBody requestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.submitReview(
        requestBody,
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
