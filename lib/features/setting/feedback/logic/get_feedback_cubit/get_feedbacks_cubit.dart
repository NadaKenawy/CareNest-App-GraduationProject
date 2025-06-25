import 'package:care_nest/features/setting/feedback/data/repo/get_feedbacks_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'get_feedbacks_state.dart';

class GetFeedbacksCubit extends Cubit<GetFeedbacksState> {
  GetFeedbacksCubit(this._getFeedbacksRepo)
      : super(const GetFeedbacksState.initial());

  final GetFeedbacksRepo _getFeedbacksRepo;

   void getFeedbacks() async {
    emit(const GetFeedbacksState.loading());
    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _getFeedbacksRepo.getFeedbacks(token);

    response.when(success: (getFeedbacksResponse) {
      emit(GetFeedbacksState.success(getFeedbacksResponse));
    }, failure: (apiErrorModel) {
      emit(GetFeedbacksState.error(apiErrorModel));
    });
  }
}
