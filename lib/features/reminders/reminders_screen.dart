import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/app_router.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'My Reminders',
          style:
              TextStyle(fontWeight: FontWeightHelper.semiBold, fontSize: 24.sp),
        )),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.kMedicationsScreen),
                child: Container(
                  height: 232.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: ColorsManager.secondryBlueColor.withOpacity(.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Image.asset(AppImages.medicineIcon),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Medications\nSchedule',
                          style: TextStyles.font20BlackSemiBold,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.kVaccinationsScreen),
                child: Container(
                  height: 232.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: ColorsManager.secondryBlueColor.withOpacity(.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Image.asset(AppImages.vaccinesIcon),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Vaccinations\nSchedule',
                          style: TextStyles.font20BlackSemiBold,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 56.h,
              ),
            ],
          )),
        ));
  }
}
