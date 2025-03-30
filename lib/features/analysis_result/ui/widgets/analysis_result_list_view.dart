import 'dart:developer';
import 'package:care_nest/features/analysis_result/data/models/analysis_result_model.dart';
import 'package:care_nest/features/analysis_result/ui/widgets/analysis_result_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../baby_cry/data/model/prediction_response_model.dart';

class AnalysisResultListView extends StatefulWidget {
  const AnalysisResultListView({super.key, required this.predictionResponse});
  final PredictionResponse predictionResponse;

  @override
  State<AnalysisResultListView> createState() => _AnalysisResultListViewState();
}

class _AnalysisResultListViewState extends State<AnalysisResultListView> {
  List<AnalysisResultModel> items = [];

  @override
  void initState() {
    super.initState();
    _initializeItems();
  }

  void _initializeItems() {
    final probabilities = widget.predictionResponse.probabilities;

    final data = [
      {
        'icon': 'assets/images/burping.svg',
        'title': 'Burping',
        'value': probabilities?.burping,
        'color': const Color(0xffE68CC7),
      },
      {
        'icon': 'assets/images/discomfort.svg',
        'title': 'Discomfort',
        'value': probabilities?.discomfort,
        'color': const Color(0xff0093D8),
      },
      {
        'icon': 'assets/images/hungry.svg',
        'title': 'Hungry',
        'value': probabilities?.hungry,
        'color': const Color(0xff95A257),
      },
      {
        'icon': 'assets/images/belly_pain.svg',
        'title': 'Belly pain',
        'value': probabilities?.bellyPain,
        'color': const Color(0xffFFBB5D),
      },
      {
        'icon': 'assets/images/tired.svg',
        'title': 'Tired',
        'value': probabilities?.tired,
        'color': const Color(0xff938DC3),
      },
    ];

    for (var item in data) {
      String? rawValue = item['value']?.toString();

      // ✅ إزالة علامة `%` وتحويل النص لرقم
      String cleanValue = rawValue?.replaceAll('%', '').trim() ?? '0';
      double parsedValue = double.tryParse(cleanValue) ?? 0;

      log('${item['title']}: ${parsedValue.toStringAsFixed(2)}%');

      items.add(AnalysisResultModel(
        icon: item['icon']! as String,
        title: item['title']! as String,
        percentage: '${parsedValue.toStringAsFixed(2)}%', // ✅ القيم صح هنا
        color: item['color']! as Color,
      ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items
            .map((e) => Padding(
                  padding: EdgeInsets.only(right: 8.5.w),
                  child: AnalysisResultListItem(analysisResultModel: e),
                ))
            .toList(),
      ),
    );
  }
}
