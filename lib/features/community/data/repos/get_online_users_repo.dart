import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/community/data/models/get_online_users/get_online_users_response.dart';

class GetOnlineUsersRepo {
  final ApiService _apiService;

  GetOnlineUsersRepo(this._apiService);

  Future<ApiResult<GetOnlineUsersResponse>> getOnlineUsers(String token) async {
    final response = await _apiService.getCommunityOnlineUsers(token);
    try {
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
