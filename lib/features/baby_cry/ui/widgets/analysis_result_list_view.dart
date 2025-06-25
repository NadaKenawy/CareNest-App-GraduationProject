import 'package:care_nest/features/baby_cry/data/model/analysis_result/analysis_result_model.dart';
import 'package:care_nest/features/baby_cry/ui/widgets/analysis_result_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/prediction/prediction_response_model.dart';

class AnalysisResultListView extends StatefulWidget {
  const AnalysisResultListView({super.key, required this.predictionResponse});
  final PredictionResponse predictionResponse;

  @override
  State<AnalysisResultListView> createState() => _AnalysisResultListViewState();
}

class _AnalysisResultListViewState extends State<AnalysisResultListView> {
  List<AnalysisResultModel> items = [];
  int? maxIndex;

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
      String cleanValue = rawValue?.replaceAll('%', '').trim() ?? '0';
      double parsedValue = double.tryParse(cleanValue) ?? 0;

      items.add(AnalysisResultModel(
        icon: item['icon']! as String,
        title: item['title']! as String,
        percentage: '${parsedValue.toStringAsFixed(2)}%',
        color: item['color']! as Color,
      ));
    }

    items.sort((a, b) {
      double aVal = double.tryParse(a.percentage.replaceAll('%', '')) ?? 0;
      double bVal = double.tryParse(b.percentage.replaceAll('%', '')) ?? 0;
      return bVal.compareTo(aVal);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.5.w),
            child: AnalysisResultListItem(
              analysisResultModel: item,
            ),
          );
        }),
      ),
    );
  }
}
