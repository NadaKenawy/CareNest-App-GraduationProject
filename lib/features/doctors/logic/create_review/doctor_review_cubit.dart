import 'dart:developer';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_request_body.dart';
import 'package:care_nest/features/doctors/logic/create_review/doctor_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/repos/doctor_review_repo.dart';

class DoctorReviewCubit extends Cubit<DoctorReviewState> {
  DoctorReviewCubit(this._doctorReviewRepo)
      : super(const DoctorReviewState.initial());

  final DoctorReviewRepo _doctorReviewRepo;

  Future<void> submitReview({
    required String doctorId,
    required int ratings,
  }) async {
    emit(const DoctorReviewState.reviewLoading());

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    final response = await _doctorReviewRepo.submitReview(
      ReviewRequestBody(
        doctor: doctorId,
        ratings: ratings,
      ),
      token,
    );

    response.when(
      success: (reviewResponse) {
        emit(DoctorReviewState.reviewSuccess(reviewResponse));
      },
      failure: (apiErrorModel) {
        log(apiErrorModel.toString());
        emit(DoctorReviewState.reviewError(apiErrorModel as ApiErrorModel));
      },
    );
  }
}
