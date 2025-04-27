import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/community/data/models/get_community_messages/get_community_messages_response.dart';

class GetCommunityMessagesRepo {
  final ApiService _apiService;

  GetCommunityMessagesRepo(this._apiService);

  Future<ApiResult<GetCommunityMessagesResponse>> getCommunityMessages(
      String token) async {
    try {
      final response = await _apiService.getCommunityMessages(token);

      final parsedResponse = GetCommunityMessagesResponse.fromJson(response);

      return ApiResult.success(parsedResponse);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
