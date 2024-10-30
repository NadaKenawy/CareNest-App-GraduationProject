import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            height: 400.h,
            width: 400.w,
            child: Image.asset(
              'assets/images/onboarding_third_screen.png',
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            'Entertainment and Shopping',
            style: TextStyles.font20BlackSemiBold,
          ),
          SizedBox(height: 40.h),
          Text(
            'Enjoy fun moments with your baby! From\nstories and games to shopping for your\nneeds, we provide everything you need to\nmake your time together special',
            style: TextStyles.font15PrimaryBlackMedium,
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
