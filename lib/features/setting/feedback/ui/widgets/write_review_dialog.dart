import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:go_router/go_router.dart';

class WriteReviewDialog extends StatefulWidget {
  const WriteReviewDialog({super.key});

  @override
  State<WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  double rating = 0;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Feedback', style: TextStyles.font20BlackSemiBold),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Text('How would you rate your experience?',
                  style: TextStyles.font16BlackMedium),
            ),
            const SizedBox(height: 8),
            Center(
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (_, __) =>
                    const Icon(Icons.star, color: Colors.amber),
                unratedColor: Colors.grey[300],
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            Text('Comments (optional)',
                style: TextStyles.font16BlackMedium.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 4,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Enter your message',
                hintStyle: TextStyles.font16BlackMedium
                    .copyWith(fontSize: 14, color: Colors.grey[600]),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                buttonText: 'Submit',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
