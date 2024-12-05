import 'package:care_nest/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class GetAllNotificationsRepo {
  final ApiService _apiService;

  GetAllNotificationsRepo(this._apiService);

  Future<ServerResult<GetAllNotificationsResponse>> getAllNotifications(String token) async {
    try {
      final response = await _apiService.getAllNotifications(token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
