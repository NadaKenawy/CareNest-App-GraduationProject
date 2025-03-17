import 'package:care_nest/features/doctors/ui/widgets/select_schedule_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';

class SelectScheduleListView extends StatelessWidget {
  const SelectScheduleListView({
    super.key,
    required this.daySchedule,
    required this.onDaySelected,
    required this.selectedDay,
  });

  final List<DaySchedule> daySchedule;
  final Function(DaySchedule) onDaySelected;
  final DaySchedule selectedDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: daySchedule.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = daySchedule[index] == selectedDay;
          return GestureDetector(
            onTap: () => onDaySelected(daySchedule[index]),
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: SelectScheduleListItem(
                day: daySchedule[index],
                isSelected: isSelected,
              ),
            ),
          );
        },
      ),
    );
  }
}
