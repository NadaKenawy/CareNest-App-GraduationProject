import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';
import 'select_schedule_list_view.dart';

class DoctorDetailsSelectSchedule extends StatelessWidget {
  const DoctorDetailsSelectSchedule({
    super.key,
    required this.doctorData,
    required this.onDaySelected,
    required this.selectedDay,
  });

  final DoctorData doctorData;
  final Function(DaySchedule) onDaySelected;
  final DaySchedule selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Schedule',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          SelectScheduleListView(
            daySchedule: doctorData.day!,
            onDaySelected: onDaySelected,
            selectedDay: selectedDay,
          ),
        ],
      ),
    );
  }
}
