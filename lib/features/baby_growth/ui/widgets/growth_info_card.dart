import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class GrowthInfoCard extends StatelessWidget {
  const GrowthInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180.h,
      left: 0,
      right: 0,
      child: Container(
        height: 140.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Last recorded weight',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeightHelper.semiBold),
                  ),
                  Text(
                    '  6.4 kg',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeightHelper.semiBold),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(
                    'Your baby’s current weight',
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeightHelper.semiBold),
                  ),
                  Text(
                    '  7.1 kg',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff3F7726),
                        fontWeight: FontWeightHelper.semiBold),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                'Your baby is growing well!',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xff3F7726),
                    fontWeight: FontWeightHelper.semiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
