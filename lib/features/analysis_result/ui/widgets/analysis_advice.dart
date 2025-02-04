import 'package:care_nest/features/analysis_result/ui/widgets/did_it_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisAdvice extends StatelessWidget {
  const AnalysisAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Needs to Burp',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Your baby might need help releasing trapped air. Try gently patting their back after feeding.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DidItWork(),
            ],
          ),
        ],
      ),
    );
  }
}
