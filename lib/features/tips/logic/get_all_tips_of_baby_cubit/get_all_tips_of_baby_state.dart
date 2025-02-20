import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_baby_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_tips_of_baby_state.freezed.dart';

@freezed
class GetAllTipsOfBabyState<T> with _$GetAllTipsOfBabyState<T> {
  const factory GetAllTipsOfBabyState.initial() = _Initial;
  const factory GetAllTipsOfBabyState.loading() = Loading;
  const factory GetAllTipsOfBabyState.success(
    List<BabyTipData>? babyTipData,
  ) = Success;
  const factory GetAllTipsOfBabyState.error(ApiErrorModel apiErrorModel) =
      Error;
}