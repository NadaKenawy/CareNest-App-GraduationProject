import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_baby_state.freezed.dart';

@freezed
class AddBabyState<T> with _$AddBabyState<T> {
  const factory AddBabyState.initial() = _Initial;
  const factory AddBabyState.addBabyloading() = AddBabyLoading;
  const factory AddBabyState.addBabysuccess(T data) = AddBabySuccess<T>;
  const factory AddBabyState.addBabyerror({required String error}) = AddBabyError;
}
