// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VaccinationItemSkeletonizer extends StatelessWidget {
  const VaccinationItemSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.r),
          border: Border(
            left: BorderSide(
              color: Colors.grey,
              width: 8.w,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BCG",
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Protects against tuberculosis (TB)",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeightHelper.medium,
                        fontSize: 12.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
