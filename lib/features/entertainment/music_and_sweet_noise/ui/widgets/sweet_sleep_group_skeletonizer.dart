import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SweetSleepGroupSkeletonizer extends StatelessWidget {
  const SweetSleepGroupSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
              padding: EdgeInsets.zero,

        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 24.w,
          mainAxisSpacing: 24.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xffebebf4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromARGB(255, 223, 223, 231),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
