import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_advice.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_message.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_percentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 268.h,
              child: const AnalysisResultMessage(),
            ),
            const AnalysisResultPercentage(),
            SizedBox(
              height: 20.h,
            ),
            const AnalysisAdvice(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(alignment: Alignment.center, children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: 70.h + (i * 20),
                      height: 70.h + (i * 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: [
                          ColorsManager.primaryPinkColor,
                          ColorsManager.primaryPinkColor.withOpacity(0.6),
                          ColorsManager.primaryPinkColor.withOpacity(0.2),
                        ][i],
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
