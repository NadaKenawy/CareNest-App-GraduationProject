import 'package:care_nest/core/models/user_model.dart';
import 'package:care_nest/features/setting/feedback/logic/get_feedback_cubit/get_feedbacks_cubit.dart';
import 'package:care_nest/features/setting/feedback/logic/create_report_cubit/create_report_cubit.dart';
import 'package:care_nest/features/setting/feedback/logic/update_report_cubit/update_report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import '../../../../../../core/logic/user_cubit/user_cubit.dart';

class WriteReviewDialog extends StatefulWidget {
  const WriteReviewDialog({
    super.key,
    required this.user,
    required this.createReportCubit,
    required this.updateReportCubit,
    required this.getFeedbacksCubit,
  });

  final UserModel user;
  final CreateReportCubit createReportCubit;
  final UpdateReportCubit updateReportCubit;
  final GetFeedbacksCubit getFeedbacksCubit;

  @override
  State<WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final createReportCubit = widget.createReportCubit;
    final updateReportCubit = widget.updateReportCubit;
    final controller = widget.user.createFeedback
        ? updateReportCubit.review
        : createReportCubit.review;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                child: Text(
                  'How would you rate your experience?',
                  style: TextStyles.font16BlackMedium,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
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
              Text(
                'Comments (optional)',
                style: TextStyles.font16BlackMedium.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller,
                maxLines: 4,
                onChanged: (_) => setState(() {}),
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
                  onPressed: (rating == 0 || controller.text.isEmpty)
                      ? null
                      : () async {
                          if (widget.user.createFeedback) {
                            //  Use UpdateReportCubit
                            updateReportCubit.emitUpdateReportStates(rating);
                          } else {
                            // Use CreateReportCubit
                            createReportCubit.emitCreateReportStates(
                              rating,
                            );
                            final updatedUser = widget.user.copyWith(
                              createFeedback: true,
                            );
                            context.read<UserCubit>().setUser(updatedUser);
                            await saveUserDataLocally(updatedUser);
                          }
                          await Future.delayed(
                              const Duration(milliseconds: 500));

                          widget.getFeedbacksCubit.getFeedbacks();

                          if (context.mounted) Navigator.of(context).pop();
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
