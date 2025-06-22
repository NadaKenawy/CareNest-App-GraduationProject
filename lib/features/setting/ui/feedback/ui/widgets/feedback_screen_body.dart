import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/setting/ui/feedback/ui/widgets/get_feedbacks_bloc_builder.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../data/models/get_feedbacks/get_feedbacks_response.dart';
import '../../../../logic/create_report_cubit/create_report_cubit.dart';
import '../../../../logic/get_feedbacks_cubit/get_feedbacks_cubit.dart';
import '../../../../logic/update_report_cubit/update_report_cubit.dart';
import 'feedback_header.dart';
import 'feedbacks_list_view.dart';
import 'write_review_dialog.dart';

class FeedbackScreenBody extends StatefulWidget {
  const FeedbackScreenBody({super.key, required this.getFeedbacksResponse});
  final GetFeedbacksResponse getFeedbacksResponse;
  @override
  State<FeedbackScreenBody> createState() => _FeedbackScreenBodyState();
}

class _FeedbackScreenBodyState extends State<FeedbackScreenBody> {
  double avgRating = 4.6;
  int totalReviews = 23;

  void showReviewDialog() async {
    final userCubit = context.read<UserCubit>().state.user;
    final createReportCubit = context.read<CreateReportCubit>();
    final updateReportCubit = context.read<UpdateReportCubit>();
    final getFeedbacksCubit = context.read<GetFeedbacksCubit>();
    await showDialog(
      context: context,
      builder: (context) => WriteReviewDialog(
        user: userCubit!,
        createReportCubit: createReportCubit,
        updateReportCubit: updateReportCubit,
        getFeedbacksCubit: getFeedbacksCubit,
      ),
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
                      avgRating: widget.getFeedbacksResponse.stats.averageRating, totalReviews: widget.getFeedbacksResponse.stats.totalReports),
                  const SizedBox(height: 16),
                 FeedbacksListView(
                    feedbacksList: widget.getFeedbacksResponse.feedbacks,
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
