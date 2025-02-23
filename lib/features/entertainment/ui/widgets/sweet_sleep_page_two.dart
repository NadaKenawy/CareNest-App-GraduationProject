import 'package:care_nest/features/entertainment/ui/widgets/entertainment_app_bar.dart';
import 'package:care_nest/features/entertainment/ui/widgets/sweet_sleep_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SweetSleepPageTwo extends StatelessWidget {
  const SweetSleepPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EntertainmentAppBar(),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const SweetSleepGroup(),
          ),
        ],
      ),
    );
  }
}
