import 'package:care_nest/features/entertainment/ui/widgets/sweet_sleep_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SweetSleepGroup extends StatelessWidget {
  const SweetSleepGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SweetSleepItem(icon: 'assets/images/wind.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/vaccum_cleaner.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/clock.png'),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            const SweetSleepItem(icon: 'assets/images/waves.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/lifebuoy.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/lightning_bolt.png'),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            const SweetSleepItem(icon: 'assets/images/ocean.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/underwater.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/lips-silence.png'),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            const SweetSleepItem(icon: 'assets/images/heart.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/hair-dryer.png'),
            SizedBox(width: 32.w),
            const SweetSleepItem(icon: 'assets/images/computer.png'),
          ],
        ),
      ],
    );
  }
}
