import 'package:care_nest/features/chat_bot/data/model/chat_bot_request_body.dart';
import 'package:care_nest/features/chat_bot/data/repo/chat_bot_repo.dart';
import 'package:care_nest/features/chat_bot/logic/chat_bot_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepo _chatBotRepo;

  ChatBotCubit(this._chatBotRepo) : super(const ChatBotState.initial());

  Future<void> sendMessage(ChatBotRequestBody requestBody) async {
    emit(const ChatBotState.loading());

    final response = await _chatBotRepo.askQuestion(requestBody);

    response.when(
      success: (chatBotResponse) {
        emit(ChatBotState.success(chatBotResponse));
      },
      failure: (error) {
        emit(ChatBotState.error(error));
      },
    );
  }
}
