import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_screen_body.dart';
import 'package:flutter/material.dart';

import '../baby_cry/data/model/prediction_response_model.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen({super.key,required this.predictionResponse});
  final PredictionResponse predictionResponse;
  @override
  Widget build(BuildContext context) {
    return  AnalysisResultScreenBody(
      predictionResponse: predictionResponse,
    );
  }
}
