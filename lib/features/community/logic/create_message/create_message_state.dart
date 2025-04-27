import 'package:care_nest/features/community/data/models/create_message/create_message_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_message_state.freezed.dart';

@freezed
class CreateMessageState with _$CreateMessageState {
  const factory CreateMessageState.initial() = _Initial;
  const factory CreateMessageState.loading() = _Loading;
  const factory CreateMessageState.success(CreateMessageResponse data) = _Success;
  const factory CreateMessageState.error({required String message}) = _Error;
}
