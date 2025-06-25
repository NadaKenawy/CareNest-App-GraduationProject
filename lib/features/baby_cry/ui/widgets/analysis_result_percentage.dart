import 'package:care_nest/features/baby_cry/ui/widgets/analysis_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/prediction/prediction_response_model.dart';

class AnalysisResultPercentage extends StatelessWidget {
  const AnalysisResultPercentage({super.key, required this.predictionResponse});
  final PredictionResponse predictionResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              child: AnalysisResultListView(
                predictionResponse: predictionResponse,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text(
            'Cry Reasons',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'These are the most likely reasons your baby is crying, ordered from most to least probable',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withValues(alpha: 0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
