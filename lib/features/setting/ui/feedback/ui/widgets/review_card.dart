import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/default_user_image.dart';
import '../../../../data/models/get_feedbacks/get_feedbacks_response.dart';

class ReviewCard extends StatelessWidget {
  final FeedbackModel feedbackModel;

  const ReviewCard({
    super.key,
    required this.feedbackModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            feedbackModel.user.image == null
                ? const DefaultUserImg()
                : CircleAvatar(
                    backgroundImage: NetworkImage(feedbackModel.user.image!),
                    radius: 22,
                  ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${feedbackModel.user.firstName} ${feedbackModel.user.lastName}',
                      style: TextStyles.font16BlackMedium),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: feedbackModel.ratings,
                        itemBuilder: (_, __) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 18,
                        unratedColor: Colors.grey[300],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        feedbackModel.ratings.toStringAsFixed(1),
                        style: TextStyles.font16BlackMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              feedbackModel.createdAt.split('T')[0],
              style: TextStyles.font12BlackMedium.copyWith(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          feedbackModel.title,
          style: TextStyles.font16BlackMedium.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
