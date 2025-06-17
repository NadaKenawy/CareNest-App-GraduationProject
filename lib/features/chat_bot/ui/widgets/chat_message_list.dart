import 'package:flutter/material.dart';
import 'package:care_nest/features/chat_bot/ui/widgets/message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatMessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return MessageBubble(text: msg['text'], isBot: msg['isBot']);
      },
    );
  }
}
