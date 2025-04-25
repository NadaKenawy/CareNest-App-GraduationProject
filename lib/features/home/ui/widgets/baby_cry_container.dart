// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BabyCryContainer extends StatelessWidget {
  const BabyCryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 168.h,
          decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 5),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Crying? Let’s find \n out why',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeightHelper.semiBold),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kRecoderScreen);
                        },
                        child: Container(
                          width: 120.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                              color: ColorsManager.primaryPinkColor,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Center(
                            child: Text(
                              'Find out',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeightHelper.semiBold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            AppImages.cryBabyImage,
          ),
        ),
      ],
    );
  }
}
