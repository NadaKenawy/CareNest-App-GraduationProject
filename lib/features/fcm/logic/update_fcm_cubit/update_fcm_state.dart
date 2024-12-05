import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_fcm_state.freezed.dart';

@freezed
class UpdateFcmState<T> with _$UpdateFcmState<T> {
  const factory UpdateFcmState.initial() = _Initial;
  const factory UpdateFcmState.updateFcmLoading() = UpdateFcmLoading;
  const factory UpdateFcmState.updateFcmSuccess(T data) = UpdateFcmSuccess<T>;
  const factory UpdateFcmState.updateFcmError(ApiErrorModel apiErrorModel) =
      UpdateFcmError;
}
