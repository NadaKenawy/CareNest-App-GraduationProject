import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class FeedbackHeader extends StatelessWidget {
  final String avgRating;
  final int totalReviews;

  const FeedbackHeader({
    super.key,
    required this.avgRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          avgRating,
          style: TextStyles.font24PrimaryPinkSemiBold.copyWith(fontSize: 40),
        ),
        const SizedBox(height: 4),
        RatingBarIndicator(
          rating: avgRating.isNotEmpty ? double.parse(avgRating) : 0.0,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 28.0,
          unratedColor: Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text(
          'based on $totalReviews reviews',
          style: TextStyles.font16BlackMedium.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}
