// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDaysWidget extends StatelessWidget {
  final List<DateTime> weekDays;
  final DateTime currentDate;

  const WeekDaysWidget({super.key, required this.weekDays, required this.currentDate});

  String _getWeekdayName(DateTime date) {
    const List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekDays.map((day) {
        final bool isToday = currentDate.day == day.day &&
            currentDate.month == day.month &&
            currentDate.year == day.year;

        return Column(
          children: [
            Text(
              _getWeekdayName(day),
              style: TextStyle(
                fontSize: 14.sp,
                color: isToday
                    ? Colors.black
                    : Colors.black.withOpacity(0.5),
                fontWeight:
                    isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: 40.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isToday
                    ? ColorsManager.primaryPinkColor
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${day.day}',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isToday ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
