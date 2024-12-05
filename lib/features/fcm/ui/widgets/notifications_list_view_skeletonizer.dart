import 'package:care_nest/features/fcm/ui/widgets/notifications_list_view_item_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsListViewSkeletonizer extends StatelessWidget {
  const NotificationsListViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const NotificationsListViewItemSkeletonizer();
        },
      ),
    );
  }
}
