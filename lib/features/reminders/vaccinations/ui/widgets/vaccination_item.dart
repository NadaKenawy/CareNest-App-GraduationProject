import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VaccinationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isPressed;

  const VaccinationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isPressed,
    required List<BabyVaccineData> vaccinesList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border(
            left: BorderSide(
              color: ColorsManager.secondryBlueColor,
              width: 8.w,
            ),
          ),
          color: ColorsManager.secondryBlueColor.withOpacity(.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isPressed
                        ? ColorsManager.secondryBlueColor
                        : Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: Icon(Icons.check, color: Colors.white, size: 28.sp),
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
