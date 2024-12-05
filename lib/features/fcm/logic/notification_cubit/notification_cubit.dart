import 'package:care_nest/features/fcm/data/repos/notification_repo.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
      : super(const NotificationsState.initial());

  void deleteNotification(String id) async {
    emit(const NotificationsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _notificationsRepo.deleteNotification(token, id);

    response.when(
      success: (deleteNotificationResponse) {
        emit(NotificationsState.deleteSuccess(
            message: deleteNotificationResponse.message));
      },
      failure: (error) {
        emit(NotificationsState.error(
             error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }

  void deleteAllNotifications() async {
    emit(const NotificationsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _notificationsRepo.deleteAllNotifications(token);

    response.when(
      success: (deleteAllNotificationsResponse) {
        emit(NotificationsState.deleteAllSuccess(
            message: deleteAllNotificationsResponse.message));
      },
      failure: (error) {
        emit(NotificationsState.error(
            error: error.signUpErrorModel.errors!.first.msg ?? ''));
      },
    );
  }
}
