import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22.h),
            SizedBox(
              height: 400.h,
              width: 400.w,
              child: Image.asset(
                'assets/images/onboarding_second_screen.png',
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Health Care And\n   Development',
              style: TextStyles.font20BlackSemiBold,
            ),
            SizedBox(height: 30.h),
            Text(
              'Track your baby\'s health and development\nwith ease! From vaccination reminders\nto health tips, we\'re here to support you',
              style: TextStyles.font15PrimaryBlackMedium,
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}
