import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicinesListView extends StatelessWidget {
  const MedicinesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Container(
              height: 96.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorsManager.secondryBlueColor.withOpacity(.25),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.medicineIcon),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Medicine name',
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
                              '9:41 AM',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
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
