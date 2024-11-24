import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_baby_state.freezed.dart';

@freezed
class UpdateBabyState<T> with _$UpdateBabyState<T> {
  const factory UpdateBabyState.initial() = _Initial;
  const factory UpdateBabyState.updateBabyLoading() = UpdateBabyLoading;
  const factory UpdateBabyState.updateBabySuccess(T data) = UpdateBabySuccess<T>;
  const factory UpdateBabyState.updateBabyError({required String error}) =
      UpdateBabyError;
}
