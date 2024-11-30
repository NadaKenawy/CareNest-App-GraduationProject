import 'package:care_nest/features/reminders/data/models/get_all_medication_schedule_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../../core/utils/app_images.dart';

class MedicinesListViewItem extends StatelessWidget {
  const MedicinesListViewItem({
    super.key,
    required this.medicinesList,
  });

  final MedicationData medicinesList;

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
                    medicinesList.medicationName ?? 'Medicine Name',
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
                        medicinesList.time ?? 'Time',
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 52.w,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.secondryBlueColor,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
