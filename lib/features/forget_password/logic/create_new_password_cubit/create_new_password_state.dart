import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';

part 'create_new_password_state.freezed.dart';

@freezed
class CreatePasswordState<T> with _$CreatePasswordState<T> {
  const factory CreatePasswordState.initial() = _Initial;
  const factory CreatePasswordState.createNewPasswordloading() = CreateNewPasswordLoading;
  const factory CreatePasswordState.createNewPasswordsuccess({required String message}) = CreateNewPasswordSuccess<T>; 
  const factory CreatePasswordState.createNewPassworderror(ApiErrorModel apiErrorModel) = CreateNewPasswordError;
}
