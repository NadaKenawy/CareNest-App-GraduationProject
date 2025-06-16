import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'feedback_header.dart';
import 'review_card.dart';
import 'write_review_dialog.dart';

class FeedbackScreenBody extends StatefulWidget {
  const FeedbackScreenBody({super.key});

  @override
  State<FeedbackScreenBody> createState() => _FeedbackScreenBodyState();
}

class _FeedbackScreenBodyState extends State<FeedbackScreenBody> {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Sara Mahmoud',
      'avatar': 'https://randomuser.me/api/portraits/women/44.jpg',
      'rating': 4.5,
      'date': '2 days ago',
      'review':
          "Very useful app! I love the baby growth tracker and the doctor chat feature is amazing."
    },
    {
      'name': 'Amira Adel',
      'avatar': 'https://randomuser.me/api/portraits/women/32.jpg',
      'rating': 4.0,
      'date': '5 days ago',
      'review':
          "Good app overall. It would be even better with more lullaby options and Arabic support."
    },
    {
      'name': 'Lina Osama',
      'avatar': 'https://randomuser.me/api/portraits/women/65.jpg',
      'rating': 5.0,
      'date': '1 week ago',
      'review':
          "Highly recommend it! The reminders for medication and vaccinations keep me on track as a new mom."
    },
    {
      'name': 'Salma Hossam',
      'avatar': 'https://randomuser.me/api/portraits/women/12.jpg',
      'rating': 4.7,
      'date': '3 weeks ago',
      'review':
          "The baby shopping section is so convenient and the recommendations are actually helpful!"
    },
  ];

  double avgRating = 4.6;
  int totalReviews = 23;

  void showReviewDialog() async {
    await showDialog(
      context: context,
      builder: (context) => const WriteReviewDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingAppBar(title: 'Feedbacks', showBackButton: true),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  FeedbackHeader(
                      avgRating: avgRating, totalReviews: totalReviews),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: reviews.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        ReviewCard(review: reviews[index]),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  AppTextButton(
                    buttonText: 'Write A Review',
                    textStyle: TextStyles.font16WhiteMedium,
                    onPressed: showReviewDialog,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
