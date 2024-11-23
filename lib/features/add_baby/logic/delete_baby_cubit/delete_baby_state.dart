import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_baby_state.freezed.dart';

@freezed
class DeleteBabyState with _$DeleteBabyState {
  const factory DeleteBabyState.initial() = _Initial;
  const factory DeleteBabyState.deleteBabyLoading() = DeleteBabyLoading;
  const factory DeleteBabyState.deleteBabySuccess() = DeleteBabySuccess;
  const factory DeleteBabyState.deleteBabyError({required String error}) = DeleteBabyError;
}
