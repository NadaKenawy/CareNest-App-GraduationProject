import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/home/ui/widgets/forward_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LargeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String routePath;

  const LargeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.onPressed,
    required this.routePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
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
              Image.asset(
                imagePath,
              ),
              SizedBox(width: 8.w),
              Image.asset(
                AppImages.arrowImage,
              ),
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
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.medium,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ForwardArrowButton(
            iconColor: backgroundColor,
            onPressed: () {
              GoRouter.of(context).push(routePath);
            },
          ),
        ],
      ),
    );
  }
}
