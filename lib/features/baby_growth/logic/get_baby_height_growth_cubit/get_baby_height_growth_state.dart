import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/baby_growth/data/models/get_baby_height_growth/get_baby_height_growth_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_baby_height_growth_state.freezed.dart';

@freezed
class GetBabyHeightGrowthState<T> with _$GetBabyHeightGrowthState<T> {
  const factory GetBabyHeightGrowthState.initial() = _Initial;
  const factory GetBabyHeightGrowthState.loading() = Loading;
  const factory GetBabyHeightGrowthState.success(
      List<MeasurementData>? measurementData) = Success;
  const factory GetBabyHeightGrowthState.error(ApiErrorModel apiErrorModel) =
      Error;
}
