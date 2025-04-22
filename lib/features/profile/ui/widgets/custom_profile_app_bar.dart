import 'package:care_nest/features/profile/ui/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/app_images.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 140.h,
              color: ColorsManager.primaryPinkColor,
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.profileClouds,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8.h,
            child: const ProfileImage(),
          ),
        ],
      ),
    );
  }
}
