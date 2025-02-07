import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class GrowthInfoCard extends StatelessWidget {
  const GrowthInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
    );
  }
}
