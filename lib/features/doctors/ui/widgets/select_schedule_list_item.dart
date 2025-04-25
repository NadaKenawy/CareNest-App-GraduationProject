import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';

class SelectScheduleListItem extends StatelessWidget {
  const SelectScheduleListItem({
    super.key,
    required this.day,
    required this.isSelected,
  });

  final DaySchedule day;
  final bool isSelected;

  String calculateDateForDay(String dayType) {
    DateTime today = DateTime.now();
    int dayOffset = 0;

    switch (dayType) {
      case 'Monday':
        dayOffset = (DateTime.monday - today.weekday + 7) % 7;
        break;
      case 'Tuesday':
        dayOffset = (DateTime.tuesday - today.weekday + 7) % 7;
        break;
      case 'Wednesday':
        dayOffset = (DateTime.wednesday - today.weekday + 7) % 7;
        break;
      case 'Thursday':
        dayOffset = (DateTime.thursday - today.weekday + 7) % 7;
        break;
      case 'Friday':
        dayOffset = (DateTime.friday - today.weekday + 7) % 7;
        break;
      case 'Saturday':
        dayOffset = (DateTime.saturday - today.weekday + 7) % 7;
        break;
      case 'Sunday':
        dayOffset = (DateTime.sunday - today.weekday + 7) % 7;
        break;
    }

    DateTime targetDate = today.add(Duration(days: dayOffset));
    return DateFormat('d').format(targetDate);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = calculateDateForDay(day.type!);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isSelected ? const Color(0xff418fbf) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : Colors.grey.withValues(alpha: 0.5),
          width: 1.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            day.type!.substring(0, 3),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
