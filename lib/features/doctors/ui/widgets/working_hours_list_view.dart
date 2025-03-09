import 'package:care_nest/features/doctors/ui/widgets/working_hours_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursListView extends StatelessWidget {
  const WorkingHoursListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const WorkingHoursListItem(),
            );
          }),
    );
  }
}
