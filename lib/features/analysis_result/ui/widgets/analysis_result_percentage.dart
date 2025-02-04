import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_list_view.dart';
import 'package:flutter/material.dart';

class AnalysisResultPercentage extends StatelessWidget {
  const AnalysisResultPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              child: const AnalysisResultListView(),
            );
  }
}