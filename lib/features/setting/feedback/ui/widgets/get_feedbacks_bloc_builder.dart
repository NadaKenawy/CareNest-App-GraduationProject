import 'package:care_nest/features/setting/feedback/logic/get_feedback_cubit/get_feedbacks_cubit.dart';
import 'package:care_nest/features/setting/feedback/ui/widgets/feedback_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/get_feedback/get_feedbacks_response.dart';
import '../../logic/get_feedback_cubit/get_feedbacks_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/features/setting/feedback/ui/widgets/feedback_header.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';

class GetFeedbacksBlocBuilder extends StatelessWidget {
  const GetFeedbacksBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFeedbacksCubit, GetFeedbacksState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (getFeedbacksResponse) {
            return setupSuccess(getFeedbacksResponse);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const Column(
      children: [
        SettingAppBar(title: 'Feedbacks', showBackButton: true),
        FeedbackScreenBodySkeleton(
          avgRating: '0.0',
          totalReviews: 0,
        ),
      ],
    );
  }

  Widget setupSuccess(GetFeedbacksResponse getFeedbacksResponse) {
    return FeedbackScreenBody(
      getFeedbacksResponse: getFeedbacksResponse,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}

class ReviewCardSkeleton extends StatelessWidget {
  const ReviewCardSkeleton({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: 18.w,
                        height: 18.w,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ],
    );
  }
}

class FeedbacksListViewSkeleton extends StatelessWidget {
  const FeedbacksListViewSkeleton({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      separatorBuilder: (_, __) => SizedBox(height: 32.h),
      itemBuilder: (context, index) => const ReviewCardSkeleton(),
    );
  }
}

class FeedbackScreenBodySkeleton extends StatelessWidget {
  const FeedbackScreenBodySkeleton({
    super.key,
    required this.avgRating,
    required this.totalReviews,
  });
  final String avgRating;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              FeedbackHeader(avgRating: avgRating, totalReviews: totalReviews),
              const FeedbacksListViewSkeleton(),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
