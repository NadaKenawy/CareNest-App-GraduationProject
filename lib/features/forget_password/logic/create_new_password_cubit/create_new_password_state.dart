import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_new_password_state.freezed.dart';

@freezed
class CreatePasswordState<T> with _$CreatePasswordState<T> {
  const factory CreatePasswordState.initial() = _Initial;
  const factory CreatePasswordState.loading() = _Loading;
  const factory CreatePasswordState.success({required String message}) = _Success<T>; 
  const factory CreatePasswordState.error({required String error}) = _Error;
}
