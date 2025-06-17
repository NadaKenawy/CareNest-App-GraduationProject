import 'package:care_nest/features/chat_bot/ui/widgets/chat_bot_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:care_nest/features/chat_bot/data/repo/chat_bot_repo.dart';
import 'package:dio/dio.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBotCubit(ChatBotRepo(Dio())),
      child: Builder(
        builder: (context) => const Scaffold(
          body: ChatBotScreenBody(),
        ),
      ),
    );
  }
}
