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
      boyAndGirlImage = AppImages.boyBabyImage;
    } else if (gender == 'Female') {
      backgroundImage = AppImages.gradientGirlImage;
      boyAndGirlImage = AppImages.girlBabyImage;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              boyAndGirlImage,
              height: 150.h,
              fit: BoxFit.contain,
            ),
            Text(
              babyName?.replaceAll(" ", "\n") ?? 'Your\nBaby Data',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
