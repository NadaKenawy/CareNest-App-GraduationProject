import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState<T> {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = Loading;
  const factory ForgetPasswordState.success(T data) = Success<T>;
  const factory ForgetPasswordState.error(ApiErrorModel apiErrorModel) = Error;
}
