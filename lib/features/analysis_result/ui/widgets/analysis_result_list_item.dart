import 'package:care_nest/features/analysis_result/data/models/analysis_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnalysisResultListItem extends StatelessWidget {
  const AnalysisResultListItem({
    super.key,
    required this.analysisResultModel,
  });

  final AnalysisResultModel analysisResultModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(analysisResultModel.icon),
          SizedBox(height: 6.h),
          Text(
            analysisResultModel.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: analysisResultModel.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              analysisResultModel.percentage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
