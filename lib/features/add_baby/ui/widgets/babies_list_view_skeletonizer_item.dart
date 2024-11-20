import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabiesListViewSkeletonizerItem extends StatelessWidget {
  final String gender; // متغير يحدد الجنس (Boy أو Girl)
  final String name;
  const BabiesListViewSkeletonizerItem({
    super.key,
    required this.gender,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color.fromARGB(255, 245, 244, 244),
        border: Border.all(
          color: const Color.fromARGB(255, 208, 208, 208),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffEDEDED).withOpacity(0.5),
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
            'assets/images/baby_boy.png',
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
