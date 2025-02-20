import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_mom_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_tips_of_mom_state.freezed.dart';

@freezed
class GetAllTipsOfMomState<T> with _$GetAllTipsOfMomState<T> {
  const factory GetAllTipsOfMomState.initial() = _Initial;
  const factory GetAllTipsOfMomState.loading() = Loading;
  const factory GetAllTipsOfMomState.success(
    List<MomTipData>? momTipData,
  ) = Success;
  const factory GetAllTipsOfMomState.error(ApiErrorModel apiErrorModel) = Error;
}
