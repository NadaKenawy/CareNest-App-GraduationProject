import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_baby_state.freezed.dart';

@freezed
class AddBabyState<T> with _$AddBabyState<T> {
  const factory AddBabyState.initial() = _Initial;
  const factory AddBabyState.loading() = Loading;
  const factory AddBabyState.success(T data) = Success<T>;
  const factory AddBabyState.error({required String error}) = Error;
}
