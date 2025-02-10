import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/font_weight_helper.dart';

class PutGrowthDataSkeletonizer extends StatelessWidget {
  const PutGrowthDataSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Last month recorded height',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeightHelper.semiBold),
              ),
              Text(
                '  6.4 cm',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeightHelper.semiBold),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                'Your baby’s current height',
                style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeightHelper.semiBold),
              ),
              Text(
                '  7.1 cm',
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
