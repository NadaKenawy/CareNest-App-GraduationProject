import 'dart:developer';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_request_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/doctor_review_repo.dart';
import 'doctor_review_state.dart';

class DoctorReviewCubit extends Cubit<DoctorReviewState> {
  final DoctorReviewRepo _doctorReviewRepo;

  DoctorReviewCubit(this._doctorReviewRepo)
      : super(const DoctorReviewState.initial());


  Future<void> submitReview({
    required String doctorId,
    required int ratings,
  }) async {
    if (!isClosed) {
      emit(const DoctorReviewState.reviewLoading());
    }

    try {
      final token =
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
          if (!isClosed) {
            emit(DoctorReviewState.reviewSuccess(reviewResponse));
          }
        },
        failure: (error) {
          late final ApiErrorModel apiError;

          if (error is ApiErrorModel) {
            apiError = error as ApiErrorModel;
          } else {
            apiError = ApiErrorModel(message: error.toString());
          }

          log('Review failure: ${apiError.message}');
          if (!isClosed) {
            emit(DoctorReviewState.reviewError(apiError));
          }
        },
      );
    } catch (e, st) {
      log('Unexpected exception in submitReview: $e\n$st');
      final fallback = ApiErrorModel(message: e.toString());
      if (!isClosed) {
        emit(DoctorReviewState.reviewError(fallback));
      }
    }
  }
}
