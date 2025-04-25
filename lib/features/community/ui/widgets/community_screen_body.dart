import 'package:care_nest/features/community/ui/widgets/community_app_bar.dart';
import 'package:care_nest/features/community/ui/widgets/message_bubbles.dart';
import 'package:care_nest/features/community/ui/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreenBody extends StatelessWidget {
  const CommunityScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommunityAppBar(),
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.only(top: 12.h, bottom: 4.h),
              children: const [
                ReceivedMessageBubble(
                  text: "All good, wanna hang out later?",
                  time: "10:02 AM",
                  avatarUrl: "assets/images/avatar1.png",
                ),
                SentMessageBubble(
                  text: "I'm good, thanks! You?",
                  time: "10:01 AM",
                ),
                ReceivedMessageBubble(
                  text: "Hey! How are you?",
                  time: "10:00 AM",
                  avatarUrl: "assets/images/avatar1.png",
                ),
              ],
            ),
          ),
          AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.only(bottom: bottomInset),
            curve: Curves.easeOut,
            child: MessageInputField(
              onSend: (message) {
                // send message logic
              },
              onPickImage: () {
                // pick image logic
              },
              onRecordAudio: () {
                // record audio logic
              },
            ),
          ),
        ],
      ),
    );
  }
}
