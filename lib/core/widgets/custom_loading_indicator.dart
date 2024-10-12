import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 30.h,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
