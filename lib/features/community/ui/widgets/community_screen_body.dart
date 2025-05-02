import 'package:care_nest/features/community/ui/widgets/community_app_bar.dart';
import 'package:care_nest/features/community/ui/widgets/message_bubbles.dart';
import 'package:care_nest/features/community/ui/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../logic/chat_cubit/chat_cubit.dart';
import '../../logic/chat_cubit/chat_state.dart';

class CommunityScreenBody extends StatefulWidget {
  const CommunityScreenBody({super.key});

  @override
  State<CommunityScreenBody> createState() => _CommunityScreenBodyState();
}

class _CommunityScreenBodyState extends State<CommunityScreenBody> {
  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatCubit>(context).getMessage();
  }

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
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  padding: EdgeInsets.only(top: 12.h, bottom: 4.h),
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];
                    return FutureBuilder<String>(
                      future: SharedPrefHelper.getOrCreateUserId(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const SizedBox();

                        final currentUserId = snapshot.data!;
                        final isMine = message.userId == currentUserId;

                        return isMine
                            ? SentMessageBubble(message: message)
                            : ReceivedMessageBubble(message: message);
                      },
                    );
                  },
                );
              },
            ),
          ),
          AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.only(bottom: bottomInset),
            curve: Curves.easeOut,
            child: MessageInputField(
              controller: controller,
              onSend: (message) {
                if (controller.text.isNotEmpty) {
                  BlocProvider.of<ChatCubit>(context).sendMessage(msg: message);
                  controller.clear();
                  _controller.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
