import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/utils/app_images.dart';

class HeaderSection extends StatelessWidget {
  final String? babyName;
  final String? gender;
  final VoidCallback? onEditTap;

  const HeaderSection({
    super.key,
    this.babyName,
    this.gender,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    String boyAndGirlImage;
    Color iconColor;
    LinearGradient? iconGradient;

    if (gender == 'Male') {
      boyAndGirlImage = AppImages.boyProfileImage;
      iconColor = ColorsManager.secondryBlueColor;
      iconGradient = null;
    } else if (gender == 'Female') {
      boyAndGirlImage = AppImages.girlProfileImage;
      iconColor = ColorsManager.primaryPinkColor;
      iconGradient = null;
    } else {
      boyAndGirlImage = AppImages.boyAndGirlImage;
      iconColor = Colors.white;
      iconGradient = const LinearGradient(
        colors: [
          ColorsManager.primaryPinkColor,
          ColorsManager.secondryBlueColor
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ); // Apply gradient for unknown gender
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              boyAndGirlImage,
              height: 150.h,
              fit: BoxFit.contain,
            ),
            Positioned(
              right: -2.w,
              bottom: -2.h,
              child: GestureDetector(
                onTap: onEditTap,
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: iconGradient != null
                      ? ShaderMask(
                          shaderCallback: (bounds) =>
                              iconGradient!.createShader(bounds),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 20.sp,
                            color: iconColor,
                          ),
                          onPressed: () {},
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
