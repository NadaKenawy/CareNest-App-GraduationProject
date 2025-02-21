import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipDetailsSkeleton extends StatelessWidget {
  const TipDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 400.h,
            color: Colors.grey[300],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 24.h,
              width: 220.w,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 40.h,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: List.generate(5, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.h,
                      width: 180.w,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 24.h,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 16.h),
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 16.h,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
