import 'package:care_nest/features/baby_cry/ui/widgets/did_it_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisAdvice extends StatelessWidget {
  final String prediction;
  final String? cryId;

  const AnalysisAdvice({super.key, required this.prediction, this.cryId});

  static const Map<String, Map<String, String>> adviceContent = {
    "burping": {
      "title": "Needs to Burp",
      "description":
          "It looks like your baby needs help releasing trapped air. Try holding them upright and gently patting or rubbing their back after feeding.",
    },
    "hungry": {
      "title": "Feeling Hungry",
      "description":
          "Your baby might be feeling hungry. Offering a gentle feed could help calm and comfort them.",
    },
    "tired": {
      "title": "Feeling Tired",
      "description":
          "Your baby may be sleepy. Try swaddling, rocking, or creating a calm, quiet space to help them drift off.",
    },
    "belly_pain": {
      "title": "Belly Discomfort",
      "description":
          "Your little one may have some tummy troubles. A gentle massage in circular motions or warm compress can ease the discomfort.",
    },
    "discomfort": {
      "title": "General Discomfort",
      "description":
          "Something might be bothering your baby. Check their diaper, clothes, room temperature, or position to ensure they're comfortable.",
    },
  };

  @override
  Widget build(BuildContext context) {
    final content = adviceContent[prediction] ??
        {
          'title': 'No advice',
          'body': 'No advice available for this prediction.'
        };

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content["title"]!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            content["description"]!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withValues(alpha: 0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DidItWork(cryId: cryId),
              
            ],
          ),
        ],
      ),
    );
  }
}
