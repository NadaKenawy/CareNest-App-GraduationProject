import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

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
                'assets/images/onboarding_first_screen.png',
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Cry Analysis',
              style: TextStyles.font20BlackSemiBold,
            ),
            SizedBox(height: 30.h),
            Text(
              'Listen to your baby\'s cries, and let us help\nyou understand the reason! With cry analysis,\nwe\'ll provide you with the right tips to meet\nyour baby\'s needs.',
              style: TextStyles.font15PrimaryBlackMedium,
            ),
          ],
        ),
      ),
    );
  }
}
