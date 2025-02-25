import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FunVideoScreenSkeleton extends StatelessWidget {
  const FunVideoScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28.w,
                height: 28.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: const BoxDecoration(
                  color: Color(0xffebebf4),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 120.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: const Color(0xffebebf4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 85.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 70.w,
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: const BoxDecoration(
                      color: Color(0xffebebf4),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffebebf4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffebebf4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 140.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffebebf4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 100.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffebebf4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
