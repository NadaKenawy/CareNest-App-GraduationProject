// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:care_nest/features/fcm/data/repos/notification_repo.dart';
import 'package:care_nest/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
      : super(const NotificationsState.initial());

  void deleteNotification(String id, BuildContext context) async {
    log('Deleting notification with id: $id');

    emit(const NotificationsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    try {
      await _notificationsRepo.deleteNotification(token, id);
      log('Notification deleted successfully.');
      emit(const NotificationsState.deleteSuccess());
      emit(const NotificationsState.loading());

      context.read<GetAllNotificationsCubit>().fetchNotifications();
    } catch (e) {
      log('Error during deletion: $e');
      emit(NotificationsState.error(error: e.toString()));
    }
  }

  void deleteAllNotifications(BuildContext context) async {
    emit(const NotificationsState.loading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    try {
      await _notificationsRepo.deleteAllNotifications(token);
      log('All Notifications deleted successfully.');
      emit(const NotificationsState.deleteSuccess());
      emit(const NotificationsState.loading());
      context.read<GetAllNotificationsCubit>().fetchNotifications();
    } catch (e) {
      log('Error during deletion: $e');
      emit(NotificationsState.error(error: e.toString()));
    }
  }
}
