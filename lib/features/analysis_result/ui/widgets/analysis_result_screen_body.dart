import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_advice.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_message.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_percentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisResultScreenBody extends StatelessWidget {
  const AnalysisResultScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsManager.primaryPinkColor2,
        title: Text(
          'Analysis Result',
          style: TextStyles.font24WhiteMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 280.h,
            child: const AnalysisResultMessage(),
          ),
          SizedBox(
            height: 23.h,
          ),
          const AnalysisResultPercentage(),
          SizedBox(
            height: 20.h,
          ),
          const AnalysisAdvice(),
        ],
      ),
    );
  }
}
