import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/age_language_dialog.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/bot_typing_indicator.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/chat_message_list.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:care_nest/features/chat_bot/logic/chat_bot_state.dart';
import 'package:care_nest/features/chat_bot/data/model/chat_bot_request_body.dart';

class ChatBotScreenBody extends StatefulWidget {
  const ChatBotScreenBody({super.key});

  @override
  State<ChatBotScreenBody> createState() => _ChatBotScreenBodyState();
}

class _ChatBotScreenBodyState extends State<ChatBotScreenBody> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();
  int? age;
  String? language;
  String? lastQuestion;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showAgeLanguageDialog());
  }

  void _showAgeLanguageDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AgeLanguageDialog(
        initialAge: age,
        initialLanguage: language,
        onConfirm: (int selectedAge, String selectedLang) {
          Navigator.pop(context, {
            'age': selectedAge,
            'language': selectedLang,
          });
        },
      ),
    );

    if (result != null && result['age'] != null && result['language'] != null) {
      setState(() {
        age = result['age'];
        language = result['language'];
        messages.clear();
      });

      context.read<ChatBotCubit>().sendMessage(
            ChatBotRequestBody(
              age: age!,
              language: language!,
              currentQuestion: "",
              answer: "",
            ),
          );
    }
  }

  void _handleSend(String text) {
    if (lastQuestion != null && age != null && language != null) {
      context.read<ChatBotCubit>().sendMessage(
            ChatBotRequestBody(
              age: age!,
              language: language!,
              currentQuestion: lastQuestion,
              answer: text,
            ),
          );
      setState(() {
        messages.add({'isBot': false, 'text': text});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryPinkColor,
        toolbarHeight: 80.h,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/bot_avatar.png'),
              radius: 23,
              backgroundColor: ColorsManager.primaryPinkColor,
            ),
            const SizedBox(width: 8),
            Text(
              'Ask BabyBot',
              style: TextStyles.font16WhiteMedium.copyWith(fontSize: 20.sp),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: _showAgeLanguageDialog,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<ChatBotCubit, ChatBotState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (response) {
              if (response.advice != null) {
                messages.add({'isBot': true, 'text': response.advice!});
              }
              if (response.question != null) {
                messages.add({'isBot': true, 'text': response.question!});
                lastQuestion = response.question;
              } else if (response.nextQuestion != null) {
                messages.add({'isBot': true, 'text': response.nextQuestion!});
                lastQuestion = response.nextQuestion;
              }
              if (response.message != null) {
                messages.add({'isBot': true, 'text': response.message!});
              }
              if (response.error != null) {
                messages.add({'isBot': true, 'text': response.error!});
              }
              setState(() {});
            },
            error: (apiError) {
              messages.add({
                'isBot': true,
                'text': apiError.message ?? 'An error occurred'
              });
              setState(() {});
            },
          );
        },
        builder: (context, state) {
          final isLoading =
              state.maybeWhen(loading: () => true, orElse: () => false);
          return Column(
            children: [
              Expanded(
                child: ChatMessageList(messages: messages),
              ),
              if (isLoading) const BotTypingIndicator(),
              MessageInputField(
                controller: _controller,
                onSend: isLoading ? (_) {} : _handleSend,
              ),
            ],
          );
        },
      ),
    );
  }
}
