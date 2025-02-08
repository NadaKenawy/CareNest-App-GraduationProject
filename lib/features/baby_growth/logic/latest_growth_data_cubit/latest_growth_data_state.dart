import 'package:care_nest/features/baby_growth/data/models/latest_growth_data/latest_growth_data_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'latest_growth_data_state.freezed.dart';
@freezed
class LatestGrowthDataState with _$LatestGrowthDataState {
  const factory LatestGrowthDataState.initial() = _Initial;
  const factory LatestGrowthDataState.loading() = Loading;
  const factory LatestGrowthDataState.success(LatestGrowthData latestGrowthData) = Success;
  const factory LatestGrowthDataState.error(ApiErrorModel apiErrorModel) = Error;
}
