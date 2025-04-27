import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'doctor_review_state.freezed.dart';

@freezed
class DoctorReviewState<T> with _$DoctorReviewState<T> {
  const factory DoctorReviewState.initial() = _Initial;
  const factory DoctorReviewState.reviewLoading() = ReviewLoading;
  const factory DoctorReviewState.reviewSuccess(T data) = ReviewSuccess<T>;
  const factory DoctorReviewState.reviewError(ApiErrorModel apiErrorModel) = ReviewError;
}
