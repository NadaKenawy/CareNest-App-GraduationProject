import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_account_state.freezed.dart';
@freezed
class VerifyAccountState<T> with _$VerifyAccountState<T> {
  const factory VerifyAccountState.initial() = _Initial;
   const factory VerifyAccountState.loading() = Loading;
  const factory VerifyAccountState.success(T data) = Success<T>;
  const factory VerifyAccountState.error({required String error}) = Error;

}