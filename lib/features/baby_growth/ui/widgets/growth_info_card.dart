import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class GrowthInfoCard extends StatelessWidget {
  const GrowthInfoCard({
    super.key,
    this.lastRecord,
    this.lastRecordValue,
    this.current,
    this.currentValue,
  });
  final String? lastRecord, lastRecordValue, current, currentValue;
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
                lastRecord ?? 'Last recorded height',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeightHelper.semiBold),
              ),
              Text(
                lastRecordValue ?? '  6.4 cm',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeightHelper.semiBold),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                current ?? 'Your baby’s current height',
                style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeightHelper.semiBold),
              ),
              Text(
                currentValue ?? '  7.1 cm',
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
