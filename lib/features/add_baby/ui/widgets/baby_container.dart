import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyContainer extends StatelessWidget {
  final String gender; // متغير يحدد الجنس (Boy أو Girl)
  final String name;
  const BabyContainer({
    super.key,
    required this.gender, required this.name, // استقبال قيمة الجيندر
  });

  @override
  Widget build(BuildContext context) {
    // تخصيص الألوان والصورة بناءً على الجنس
    final Color containerColor = gender == 'Boy'
        ? ColorsManager.secondryBlueColor
        : ColorsManager.primaryPinkColor;
    final String babyImage =
        gender == 'Boy' ? AppImages.boyBabyImage : AppImages.girlBabyImage;

    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffF0F0F0),
        border: Border.all(
          color: containerColor,
        ),
        boxShadow: [
          BoxShadow(
            color: containerColor.withOpacity(0.5),
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Image.asset(
            babyImage,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 32.w),
          Text(
            name,
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
