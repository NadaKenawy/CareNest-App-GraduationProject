import 'package:care_nest/features/analysis_result/data/models/analysis_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnalysisResultListItem extends StatelessWidget {
  const AnalysisResultListItem({
    super.key,
    required this.analysisResultModel,
  });
  final AnalysisResultModel analysisResultModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          analysisResultModel.icon,
          width: 20,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          analysisResultModel.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: analysisResultModel.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            analysisResultModel.percentage,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
