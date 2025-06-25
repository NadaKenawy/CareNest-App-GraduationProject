import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/baby_cry/ui/widgets/analysis_advice.dart';
import 'package:care_nest/features/baby_cry/ui/widgets/analysis_result_message.dart';
import 'package:care_nest/features/baby_cry/ui/widgets/analysis_result_percentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/prediction/prediction_response_model.dart';

class AnalysisResultScreenBody extends StatelessWidget {
  const AnalysisResultScreenBody({super.key, required this.predictionResponse});
  final PredictionResponse predictionResponse;

  @override
  Widget build(BuildContext context) {
    final prediction = predictionResponse.prediction;

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
              child: AnalysisResultMessage(
                prediction: prediction ?? 'hungry',
              ),
            ),
            AnalysisResultPercentage(
              predictionResponse: predictionResponse,
            ),
            SizedBox(height: 20.h),
            AnalysisAdvice(
              prediction: prediction ?? 'hungry',
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        width: 70.h + (i * 15),
                        height: 70.h + (i * 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: [
                            ColorsManager.primaryPinkColor,
                            ColorsManager.primaryPinkColor
                                .withValues(alpha: 0.6),
                            ColorsManager.primaryPinkColor
                                .withValues(alpha: 0.2),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
