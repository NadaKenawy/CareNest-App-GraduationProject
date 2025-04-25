import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursListItem extends StatelessWidget {
  const WorkingHoursListItem({
    super.key,
    required this.hourSchedule,
    required this.isSelected,
    this.isBooked = false,
  });

  final Slot hourSchedule;
  final bool isSelected;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isBooked
        ? Colors.red.withValues(alpha: 0.1)
        : isSelected
            ? ColorsManager.secondryBlueColor
            : Colors.white;

    final Color borderColor = isBooked
        ? Colors.red.withValues(alpha: 0.3)
        : isSelected
            ? Colors.transparent
            : Colors.grey.withValues(alpha: 0.5);

    final Color textColor = isBooked
        ? Colors.red
        : isSelected
            ? Colors.white
            : Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor, width: 1.2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hourSchedule.startTime ?? '',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: textColor,
            ),
          ),
          if (isBooked)
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Text(
                '(Booked)',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
