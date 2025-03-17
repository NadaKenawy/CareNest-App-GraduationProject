import 'package:care_nest/features/doctors/ui/widgets/working_hours_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';

class DoctorDetailsWorkingHours extends StatelessWidget {
  const DoctorDetailsWorkingHours({
    super.key,
    required this.doctorData,
    required this.selectedDay,
    this.selectedHour,
    required this.onHourSelected,
  });


  final DoctorData doctorData;
  final DaySchedule selectedDay;
  final String? selectedHour;
  final Function(String) onHourSelected;


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
            'Working Hours',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          WorkingHoursListView(
            daySchedule: doctorData.day!,
            selectedDay: selectedDay,
             selectedHour: selectedHour,
            onHourSelected: onHourSelected,
          ),
        ],
      ),
    );
  }
}
