import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_all_medication_schedule_response.dart';

class MedicinesListView extends StatelessWidget {
  const MedicinesListView({
    super.key,
    required this.medicinesList,
  });
  final List<MedicationData> medicinesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: medicinesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
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
                          medicinesList[index].medicationName ??
                              'Medicine Name',
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
                              medicinesList[index].time ?? 'Time',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5)),
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
        },
      ),
    );
  }
}
