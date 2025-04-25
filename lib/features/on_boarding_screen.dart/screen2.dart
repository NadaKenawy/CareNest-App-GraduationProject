import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.h),
          SizedBox(
            height: 350.h,
            width: 350.w,
            child: Image.asset(
              'assets/images/onboarding_second_screen.webp',
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Health Care And\n   Development',
            style: TextStyles.font20BlackSemiBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Track your baby\'s health and development\nwith ease! From vaccination reminders\nto health tips, we\'re here to support you',
              style: TextStyles.font16BlackMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
