import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/app_images.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180.h,
          width: double.infinity,
          color: ColorsManager.primaryPinkColor,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.profileClouds,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60.h,
          left: 16.w,
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              SizedBox(width: 8.w),
              Text("Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        
      ],
    );
  }
}