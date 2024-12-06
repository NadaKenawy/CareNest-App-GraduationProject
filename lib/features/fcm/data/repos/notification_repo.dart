import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';
import 'package:care_nest/features/fcm/data/models/delete_all_notifications/delete_all_notifications_response.dart';
import 'package:care_nest/features/fcm/data/models/delete_notification/delete_notification_response.dart';

class NotificationsRepo {
  final ApiService _apiService;

  NotificationsRepo(this._apiService);

  Future<ServerResult<DeleteNotificationResponse>> deleteNotification(
      String token, String id) async {
    try {
      final response = await _apiService.deleteNotification(token, id);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }

  Future<ServerResult<DeleteAllNotificationsResponse>> deleteAllNotifications(
      String token) async {
    try {
      final response = await _apiService.deleteAllNotifications(token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
