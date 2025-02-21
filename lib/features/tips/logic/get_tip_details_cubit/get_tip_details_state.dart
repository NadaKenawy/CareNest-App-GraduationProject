import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/tips/data/models/get_tip_details_response.dart';
part 'get_tip_details_state.freezed.dart';

@freezed
class GetTipDetailsState with _$GetTipDetailsState {
  const factory GetTipDetailsState.initial() = _Initial;
  const factory GetTipDetailsState.loading() = Loading;
  const factory GetTipDetailsState.success(TipDetails tipDetails) = Success;
  const factory GetTipDetailsState.error(ApiErrorModel apiErrorModel) = Error;
}
