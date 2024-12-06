import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_cubit.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_state.dart';
import 'package:care_nest/features/fcm/ui/widgets/notification_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
            return IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.bottomSlide,
                  title: 'Delete Notifications',
                  desc: 'Are you sure you want to delete all notifications?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    context
                        .read<NotificationsCubit>()
                        .deleteAllNotifications(context);
                  },
                ).show();
              },
              icon: const Icon(Icons.delete_outline),
            );
          }),
        ],
      ),
      body: const NotificationBlocBuilder(),
    );
  }
}
