import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_message_state.freezed.dart';

@freezed
class DeleteMessageState with _$DeleteMessageState {
  const factory DeleteMessageState.initial() = Initial;
  const factory DeleteMessageState.loading() = Loading;
  const factory DeleteMessageState.success(String deletedId) = Success;
  const factory DeleteMessageState.error(String error) = Error;
}
