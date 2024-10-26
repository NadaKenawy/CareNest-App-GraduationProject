import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/home/ui/widgets/forward_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color backgroundColor;

  const LargeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      height: 240.h,
      width: MediaQuery.of(context).size.width * 0.5 - 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath),
              SizedBox(
                width: 4.w,
              ),
              Image.asset("assets/images/arrow.png"),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: Colors.white,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: Colors.white,
            ),
          ),
          const ForwardArrowButton(
            iconColor: ColorsManager.secondryBlueColor,
          ),
        ],
      ),
    );
  }
}
