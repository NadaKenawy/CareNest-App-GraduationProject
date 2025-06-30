import 'package:care_nest/features/baby_cry/ui/widgets/analysis_result_screen_body.dart';
import 'package:flutter/material.dart';

import '../data/model/prediction/prediction_response_model.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen(
      {super.key, required this.predictionResponse, this.cryId});
  final PredictionResponse predictionResponse;
  final String? cryId;
  @override
  Widget build(BuildContext context) {
    return AnalysisResultScreenBody(
      predictionResponse: predictionResponse,
      cryId: cryId,
    );
  }
}
