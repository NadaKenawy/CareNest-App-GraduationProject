import 'package:care_nest/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_notifications_state.freezed.dart';

@freezed
class GetAllNotificationsState with _$GetAllNotificationsState {
  const factory GetAllNotificationsState.initial() = _Initial;
  const factory GetAllNotificationsState.loading() = Loading;
  const factory GetAllNotificationsState.success(List<NotificationData>? notificationsData) = Success;
  const factory GetAllNotificationsState.error({required String error}) = Error;
}
