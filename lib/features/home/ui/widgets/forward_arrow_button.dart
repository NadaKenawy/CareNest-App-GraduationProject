import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForwardArrowButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed; 

  const ForwardArrowButton({
    super.key,
    required this.iconColor,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: IconButton(
          icon: FaIcon(
            Icons.arrow_forward,
            color: iconColor,
          ),
          onPressed: onPressed, 
          padding: EdgeInsets.zero,
          iconSize: 25.sp,
        ),
      ),
    );
  }
}
