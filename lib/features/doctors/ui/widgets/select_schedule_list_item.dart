import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';

class SelectScheduleListItem extends StatelessWidget {
  const SelectScheduleListItem({
    super.key,
    required this.day,
    required this.isSelected,
  });

  final DaySchedule day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isSelected ? const Color(0xff418fbf) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.black,
          width: 1.5.w,
        ),
      ),
      child: Center(
        child: Text(
          day.type!.substring(0, 3),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
