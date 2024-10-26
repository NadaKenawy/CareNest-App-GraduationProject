import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyCryContainer extends StatelessWidget {
  const BabyCryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 168.h,
          decoration: BoxDecoration(
            color: const Color(0xffE9E7E7),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Crying? Let’s find \n out why',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.semiBold),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 120.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                            color: ColorsManager.primaryPinkColor,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Center(
                          child: Text(
                            'Find out',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.semiBold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(AppImages.cryBabyImage),
        ),
      ],
    );
  }
}
