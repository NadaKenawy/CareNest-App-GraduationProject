import 'package:care_nest/features/setting/feedback/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_feedback/get_feedbacks_response.dart';

class FeedbacksListView extends StatelessWidget {
  const FeedbacksListView({super.key, required this.feedbacksList});
  final List<FeedbackModel> feedbacksList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: feedbacksList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: ReviewCard(
              feedbackModel: feedbacksList[index],
            ),
          );
        });
  }
}
