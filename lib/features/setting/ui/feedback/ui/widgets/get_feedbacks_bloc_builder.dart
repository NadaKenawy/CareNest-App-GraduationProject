import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/setting/logic/get_feedbacks_cubit/get_feedbacks_cubit.dart';
import 'package:care_nest/features/setting/ui/feedback/ui/widgets/feedback_screen_body.dart';
import 'package:care_nest/features/setting/ui/feedback/ui/widgets/feedbacks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/get_feedbacks/get_feedbacks_response.dart';
import '../../../../logic/get_feedbacks_cubit/get_feedbacks_state.dart';

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
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.primaryBlueColor,
        strokeWidth: 2.0,
      ),
    );
  }

  Widget setupSuccess( GetFeedbacksResponse getFeedbacksResponse) {
    return FeedbackScreenBody(
      getFeedbacksResponse: getFeedbacksResponse,
      
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
