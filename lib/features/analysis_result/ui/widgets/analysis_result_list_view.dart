import 'package:care_nest/features/analysis_result/data/models/analysis_result_model.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_list_item.dart';
import 'package:flutter/material.dart';

class AnalysisResultListView extends StatelessWidget {
  const AnalysisResultListView({super.key});

  static const items = [
    AnalysisResultModel(
      icon: 'assets/images/burping.svg',
      title: 'Burping',
      percentage: '52%',
      color: Color(0xffE68CC7),
    ),
    AnalysisResultModel(
      icon: 'assets/images/discomfort.svg',
      title: 'Discomfort',
      percentage: '25%',
      color: Color(0xff0093D8),
    ),
    AnalysisResultModel(
      icon: 'assets/images/hungry.svg',
      title: 'Hungry',
      percentage: '13%',
      color: Color(0xff95A257),
    ),
    AnalysisResultModel(
      icon: 'assets/images/belly_pain.svg',
      title: 'Belly pain',
      percentage: '8%',
      color: Color(0xffFFBB5D),
    ),
    AnalysisResultModel(
      icon: 'assets/images/tired.svg',
      title: 'Tired',
      percentage: '2%',
      color: Color(0xff938DC3),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: AnalysisResultListItem(
            analysisResultModel: items[index],
          ),
        );
      },
    );
  }
}
