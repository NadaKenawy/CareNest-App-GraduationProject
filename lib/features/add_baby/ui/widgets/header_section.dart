import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/utils/app_images.dart';

class HeaderSection extends StatelessWidget {
  final String? babyName;
  final String? gender;

  const HeaderSection({
    super.key,
    this.babyName,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    String backgroundImage;
    String boyAndGirlImage;
    if (gender == 'Male') {
      backgroundImage = AppImages.gradientBoyImage;
      boyAndGirlImage = AppImages.boyProfileImage;
    } else if (gender == 'Female') {
      backgroundImage = AppImages.gradientGirlImage;
      boyAndGirlImage = AppImages.girlProfileImage;
    } else {
      backgroundImage = AppImages.gradientBoyAndGirlImage;
      boyAndGirlImage = AppImages.boyAndGirlImage;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 274.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Image.asset(
                boyAndGirlImage,
                height: 150.h,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 40.w),
              Expanded(
                child: Text(
                  babyName != null
                      ? '$babyName\'s\nProfile'
                      : 'Baby\'s\nProfile',
                  textAlign: TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
