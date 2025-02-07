
import 'package:care_nest/features/baby_growth/data/models/get_baby_weight_growth_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'get_baby_weight_growth_state.freezed.dart';
@freezed
class GetBabyWeightGrowthState with _$GetBabyWeightGrowthState {
  const factory GetBabyWeightGrowthState.initial() = _Initial;
   const factory GetBabyWeightGrowthState.loading() = Loading;
  const factory GetBabyWeightGrowthState.success(
      List<MeasurementData>? measurementData) = Success;
  const factory GetBabyWeightGrowthState.error(ApiErrorModel apiErrorModel) =
      Error;
}
