import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnalysisResultMessage extends StatelessWidget {
  final String prediction;

  const AnalysisResultMessage({super.key, required this.prediction});

  static const Map<String, String> messages = {
    "burping": "Need to burp  ",
    "hungry": "I am so hungry",
    "tired": "I need some zz",
    "belly_pain": "Tummy is hurty",
    "discomfort": "I feel not okay",
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
              top: 22.h,
              right: 12.w,
              child: Text(message,
                  style: TextStyles.font20BlackSemiMedium
                      .copyWith(fontSize: 23.sp)),
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
