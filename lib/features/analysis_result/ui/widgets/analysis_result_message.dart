// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnalysisResultMessage extends StatelessWidget {
  final String prediction;

  const AnalysisResultMessage({super.key, required this.prediction});

  static const Map<String, String> messages = {
    "burping": "Burp time!",
    "hungry": "Feed me!",
    "tired": "Sleepy now!",
    "belly_pain": "Tummy hurt!",
    "discomfort": "Not comfy!",
  };

  @override
  Widget build(BuildContext context) {
    final message = messages[prediction] ?? "I'm not sure!";

    return Padding(
      padding: EdgeInsets.only(top: 16.h, right: 40.h),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset('assets/images/analysis_result_vector.svg'),
            Positioned(
              top: 24.h,
              right: 38.w,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Positioned(
              top: 44.h,
              right: 124.w,
              child: Image.asset(
                'assets/images/analysis_result_baby2.webp',
                width: 200.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
