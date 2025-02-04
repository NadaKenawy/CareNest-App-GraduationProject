import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnalysisResultMessage extends StatelessWidget {
  const AnalysisResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        right: 40.h,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              'assets/images/analysis_result_vector.svg',
              // width: 200.w,
            ),
            Positioned(
              top: 24.h,
              right: 18.w,
              child: Text(
                "I need to burp!",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Positioned(
              top: 44.h,
              right: 124.w,
              child: Image.asset(
                'assets/images/analysis_result_baby2.png',
                width: 200.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
