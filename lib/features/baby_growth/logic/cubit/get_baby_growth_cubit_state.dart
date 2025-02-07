import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:care_nest/features/baby_growth/data/models/get_baby_growth_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_baby_growth_cubit_state.freezed.dart';

@freezed
class GetBabyGrowthHeightCubitState<T> with _$GetBabyGrowthHeightCubitState<T> {
  const factory GetBabyGrowthHeightCubitState.initial() = _Initial;
  const factory GetBabyGrowthHeightCubitState.loading() = Loading;
  const factory GetBabyGrowthHeightCubitState.success(
      List<MeasurementData>? measurementData) = Success;
  const factory GetBabyGrowthHeightCubitState.error(
      ApiErrorModel apiErrorModel) = Error;
}
