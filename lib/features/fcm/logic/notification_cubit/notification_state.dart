import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.deleteSuccess() = _DeleteSuccess;
  const factory NotificationsState.deleteAllSuccess() = _DeleteAllSuccess;
  const factory NotificationsState.error({required String error}) = _Error;
}
