// lib/widgets/vaccination_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class VaccinationItem extends StatelessWidget {
  final String vaccinationName;
  final String description;
  final String date;

  const VaccinationItem({
    super.key,
    required this.vaccinationName,
    required this.description,
    required this.date,
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.secondryBlueColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: Icon(Icons.check, color: Colors.white, size: 28.sp),
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vaccinationName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeightHelper.medium,
                      fontSize: 12.sp,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
