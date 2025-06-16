import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(review['avatar']),
              radius: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review['name'], style: TextStyles.font16BlackMedium),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: review['rating'],
                        itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 18,
                        unratedColor: Colors.grey[300],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        review['rating'].toStringAsFixed(1),
                        style: TextStyles.font16BlackMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              review['date'],
              style: TextStyles.font12BlackMedium.copyWith(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          review['review'],
          style: TextStyles.font12BlackMedium.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
