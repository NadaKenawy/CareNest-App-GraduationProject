import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/app_images.dart';

class SettingAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const SettingAppBar({
    super.key,
    this.title = 'Setting',
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 156.h,
              color: ColorsManager.primaryPinkColor,
            ),
          ),
          Positioned(
            top: 56.h,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.profileClouds,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 52.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              children: [
                if (showBackButton)
                  IconButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: showBackButton ? 0 : 32.w,
                    ),
                    child: Text(title,
                        style: TextStyles.font16WhiteMedium.copyWith(
                          fontSize: showBackButton ? 20.sp : 24.sp,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
