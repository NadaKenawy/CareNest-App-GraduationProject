import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursListItem extends StatelessWidget {
  const WorkingHoursListItem(
      {super.key, required this.hourSchedule, required this.isSelected});
  final Slot hourSchedule;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isSelected ? const Color(0xff418fbf) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.black,
          width: 1.5.w,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          hourSchedule.startTime!,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
