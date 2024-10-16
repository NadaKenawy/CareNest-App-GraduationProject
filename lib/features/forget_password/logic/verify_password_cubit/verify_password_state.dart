import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_password_state.freezed.dart';
@freezed
class VerifyPasswordState<T> with _$VerifyPasswordState<T> {
  const factory VerifyPasswordState.initial() = _Initial;
   const factory VerifyPasswordState.loading() = Loading;
  const factory VerifyPasswordState.success(T data) = Success<T>;
  const factory VerifyPasswordState.error({required String error}) = Error;

}
