// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styless.dart';
import '../../../../../core/utils/app_images.dart';

class MedicinesListViewSkeletonizerItem extends StatelessWidget {
  const MedicinesListViewSkeletonizerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        height: 96.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorsManager.secondryBlueColor.withOpacity(.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.medicineIcon,
                height: 56.h,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "medicationName",
                    style: TextStyles.font16PrimaryBlackMedium,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.black.withOpacity(.5),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "11:50",
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 52.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
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
