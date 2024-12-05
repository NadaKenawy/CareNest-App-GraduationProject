import 'package:care_nest/features/fcm/ui/widgets/notification_bloc_builder.dart';
import 'package:flutter/material.dart';
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
          IconButton(
            onPressed: () {
              // Function to remove all notifications
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: const NotificationBlocBuilder(),
    );
  }
}
