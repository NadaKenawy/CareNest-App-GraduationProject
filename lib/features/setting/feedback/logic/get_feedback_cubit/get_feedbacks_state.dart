import 'package:care_nest/features/setting/feedback/data/models/get_feedback/get_feedbacks_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/networking/api_error_model.dart';
part 'get_feedbacks_state.freezed.dart';
@freezed
class GetFeedbacksState<T> with _$GetFeedbacksState<T> {
  const factory GetFeedbacksState.initial() = _Initial;
  const factory GetFeedbacksState.loading() = Loading;
  const factory GetFeedbacksState.success(GetFeedbacksResponse getFeedbacksResponse) = Success;
  const factory GetFeedbacksState.error(ApiErrorModel apiErrorModel) = Error;
}


