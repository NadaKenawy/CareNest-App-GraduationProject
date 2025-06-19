import 'dart:developer';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/age_language_dialog.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/bot_typing_indicator.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/chat_message_list.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/message_input_field.dart';
import 'package:care_nest/features/chat_bot/data/services/chat_storage_service.dart';
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
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    await _loadSavedMessages();
    await _loadUserPreferences();
  }

  Future<void> _loadSavedMessages() async {
    try {
      List<Map<String, dynamic>> savedMessages =
          await ChatStorageService.getMessagesAsMap();
      setState(() {
        messages.clear();
        messages.addAll(savedMessages);
      });

      if (savedMessages.isNotEmpty) {
        final foundLastQuestion =
            ChatStorageService.findLastQuestionFromMessages(savedMessages);
        if (foundLastQuestion != null) {
          lastQuestion = foundLastQuestion;
        }
      }
    } catch (e) {
     log('Error loading saved messages: $e');
    }
  }

  Future<void> _loadUserPreferences() async {
    try {
      final savedAge = await ChatStorageService.getUserAge();
      final savedLanguage = await ChatStorageService.getUserLanguage();

      if (savedAge != null && savedLanguage != null) {
        setState(() {
          age = savedAge;
          language = savedLanguage;
        });

        if (messages.isEmpty) {
          _startNewConversation();
        } else {
          final savedLastQuestion = await ChatStorageService.getLastQuestion();
          if (savedLastQuestion != null) {
            lastQuestion = savedLastQuestion;
          }
        }
      } else {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => _showAgeLanguageDialog());
      }
    } catch (e) {
     log('Error loading user preferences: $e');
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showAgeLanguageDialog());
    }
  }

  Future<void> _saveMessage(Map<String, dynamic> message) async {
    try {
      await ChatStorageService.saveMessageFromMap(message);
    } catch (e) {
     log('Error saving message: $e');
    }
  }

  void _startNewConversation() {
    if (age != null && language != null) {
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
      });

      await ChatStorageService.saveUserPreferences(age!, language!);
      _startNewConversation();
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

      final userMessage = {'isBot': false, 'text': text};
      setState(() {
        messages.add(userMessage);
      });

      _saveMessage(userMessage);
      _controller.clear();
    }
  }

  void _showClearChatDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Clear Chat', style: TextStyles.font20BlackSemiMedium),
        content: Text(
          'Are you sure you want to clear all messages?',
          style: TextStyles.font16BlackMedium.copyWith(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyles.font16BlackMedium.copyWith(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await ChatStorageService.clearMessages();
              setState(() {
                messages.clear();
                lastQuestion = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Chat cleared successfully',
                    style:
                        TextStyles.font16WhiteMedium.copyWith(fontSize: 14.sp),
                  ),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Clear',
              style: TextStyles.font16WhiteMedium.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
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
            icon: const Icon(Icons.delete_sweep, color: Colors.white),
            onPressed: _showClearChatDialog,
          ),
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
            success: (response) async {
              // Save advice first if present
              if (response.advice != null && response.advice!.isNotEmpty) {
                final adviceMessage = {'isBot': true, 'text': response.advice!};
                setState(() {
                  messages.add(adviceMessage);
                });
                await _saveMessage(adviceMessage);
                await Future.delayed(const Duration(milliseconds: 100));
              }

              // Save question/nextQuestion after advice
              if (response.question != null && response.question!.isNotEmpty) {
                final questionMessage = {
                  'isBot': true,
                  'text': response.question!
                };
                setState(() {
                  messages.add(questionMessage);
                });
                await _saveMessage(questionMessage);
                lastQuestion = response.question;
                await ChatStorageService.saveLastQuestion(response.question!);
              } else if (response.nextQuestion != null &&
                  response.nextQuestion!.isNotEmpty) {
                final questionMessage = {
                  'isBot': true,
                  'text': response.nextQuestion!
                };
                setState(() {
                  messages.add(questionMessage);
                });
                await _saveMessage(questionMessage);
                lastQuestion = response.nextQuestion;
                await ChatStorageService.saveLastQuestion(
                    response.nextQuestion!);
              }

              // Save message/error last
              if (response.message != null && response.message!.isNotEmpty) {
                final messageMessage = {
                  'isBot': true,
                  'text': response.message!
                };
                setState(() {
                  messages.add(messageMessage);
                });
                await _saveMessage(messageMessage);
              }

              if (response.error != null && response.error!.isNotEmpty) {
                final errorMessage = {'isBot': true, 'text': response.error!};
                setState(() {
                  messages.add(errorMessage);
                });
                await _saveMessage(errorMessage);
              }
            },
            error: (apiError) {
              final botMessage = {
                'isBot': true,
                'text': apiError.message ?? 'An error occurred'
              };
              messages.add(botMessage);
              _saveMessage(botMessage);
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
                child: messages.isEmpty && !isLoading
                    ? Container(
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to BabyBot! 👶',
                              style: TextStyles.font16BlackMedium.copyWith(
                                fontSize: 22.sp,
                                color: ColorsManager.primaryPinkColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'I\'m here to help you take care of your baby\nand answer all your questions',
                              style: TextStyles.font16BlackMedium.copyWith(
                                fontSize: 16.sp,
                                color: Colors.grey[600],
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32.h),
                            InkWell(
                              onTap: () => _showAgeLanguageDialog(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.tips_and_updates,
                                      size: 16.sp,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Start chatting to get helpful tips',
                                      style:
                                          TextStyles.font16BlackMedium.copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ChatMessageList(messages: messages),
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
