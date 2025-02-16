import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

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
              'assets/images/onboarding_third_screen.webp',
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Entertainment and Shopping',
            style: TextStyles.font20BlackSemiBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            'Make parenting fun and convenient with our\nentertainment and shopping features! Find\nproducts, activities, and tips to keep your\nbaby happy and healthy.',
            style: TextStyles.font16PrimaryBlackMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
