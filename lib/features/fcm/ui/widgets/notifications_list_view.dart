import 'package:care_nest/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_cubit.dart';
import 'package:care_nest/features/fcm/ui/widgets/no_notifications_text.dart';
import 'package:care_nest/features/fcm/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notificationsList});
  final List<NotificationData> notificationsList;

  @override
  Widget build(BuildContext context) {
    if (notificationsList.isEmpty) {
      return const NoNotificationsText();
    }
    return ListView.builder(
      itemCount: notificationsList.length,
      itemBuilder: (BuildContext context, int index) {
        final createdAt = notificationsList[index].createdAt;
        final formattedTime = createdAt != null
            ? DateFormat.Hm().format(DateTime.parse(createdAt.toString()))
            : "";

        return NotificationItem(
          title: notificationsList[index].title ?? "",
          message: notificationsList[index].message ?? "",
          time: formattedTime,
          onDelete: () {
            context
                .read<NotificationsCubit>()
                .deleteNotification(notificationsList[index].id ?? '', context);
          },
        );
      },
    );
  }
}
