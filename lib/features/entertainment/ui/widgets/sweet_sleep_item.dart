import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SweetSleepItem extends StatelessWidget {
  const SweetSleepItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xff011836),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.asset(
              icon,
              height: 60.h,
              width: 60.w,
            ),
          ),
        ),
      ],
    );
  }
}
