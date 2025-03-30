// ignore_for_file: deprecated_member_use

import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../baby_cry/data/model/prediction_response_model.dart';

class AnalysisResultPercentage extends StatelessWidget {
  const AnalysisResultPercentage({super.key, required this.predictionResponse});
  final PredictionResponse predictionResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 100.h,
              child:  AnalysisResultListView(
                predictionResponse: predictionResponse,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
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
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
