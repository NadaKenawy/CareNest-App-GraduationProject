import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/prediction/prediction_response_model.dart';
part 'prediction_state.freezed.dart';
@freezed
class PredictionState<T> with _$PredictionState<T> {
  const factory PredictionState.initial() = _Initial;
  const factory PredictionState.loading() = Loading;
  const factory PredictionState.success(PredictionResponse response) = Success;
  const factory PredictionState.error(ApiErrorModel apiErrorModel) = Error;
}
