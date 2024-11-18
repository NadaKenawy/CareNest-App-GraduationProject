import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyContainer extends StatelessWidget {
  const BabyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffF0F0F0),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Image.asset(
            AppImages.boyBabyImage,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 32.w),
          Text(
            'Baby Name',
            style: TextStyle(
              fontWeight: FontWeightHelper.semiBold,
              fontSize: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}