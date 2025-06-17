import 'package:care_nest/features/chat_bot/data/model/chat_bot_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:care_nest/core/networking/api_error_model.dart';

part 'chat_bot_state.freezed.dart';

@freezed
class ChatBotState<T> with _$ChatBotState<T> {
  const factory ChatBotState.initial() = _Initial;
  const factory ChatBotState.loading() = Loading;
  const factory ChatBotState.success(ChatBotResponse response) = Success;
  const factory ChatBotState.error(ApiErrorModel apiErrorModel) = Error;
}
