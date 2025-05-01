import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultUserImg extends StatelessWidget {
  const DefaultUserImg({
    super.key,
    this.iconSize,
    this.containerWidth,
    this.containerHeight,
  });
  final double? iconSize;
  final double? containerWidth;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth ?? 42.w,
      height: containerHeight ?? 42.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: Icon(Icons.person, color: Colors.white, size: iconSize ?? 30.sp),
    );
  }
}
