import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_growth_data_state.freezed.dart';

@freezed
class PutGrowthDataState<T> with _$PutGrowthDataState<T> {
  const factory PutGrowthDataState.initial() = _Initial;
  const factory PutGrowthDataState.putGrowthDataLoading() = PutGrowthDataLoading;
  const factory PutGrowthDataState.putGrowthDataSuccess(T data) = PutGrowthDataSuccess<T>;
  const factory PutGrowthDataState.putGrowthDataError({required String error}) = PutGrowthDataError;
}
