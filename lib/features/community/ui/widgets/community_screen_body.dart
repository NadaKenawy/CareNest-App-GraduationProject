import 'dart:developer';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/community/data/models/get_community_messages/get_community_messages_response.dart';
import 'package:care_nest/features/community/logic/get_community_messages/get_community_messages_cubit.dart';
import 'package:care_nest/features/community/logic/get_community_messages/get_community_messages_state.dart';
import 'package:care_nest/features/community/logic/create_message/create_message_cubit.dart';
import 'package:care_nest/features/community/logic/create_message/create_message_state.dart';
import 'package:care_nest/features/community/ui/widgets/community_app_bar.dart';
import 'package:care_nest/features/community/ui/widgets/message_bubbles.dart';
import 'package:care_nest/features/community/ui/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:record/record.dart';
import 'package:care_nest/features/community/logic/delete_message/delete_message_cubit.dart';
import 'package:care_nest/features/community/logic/delete_message/delete_message_state.dart'
    as delete_msg;
import 'package:awesome_dialog/awesome_dialog.dart';

class CommunityScreenBody extends StatefulWidget {
  const CommunityScreenBody({super.key});

  @override
  _CommunityScreenBodyState createState() => _CommunityScreenBodyState();
}

class _CommunityScreenBodyState extends State<CommunityScreenBody> {
  String? _currentUserId;
  final ScrollController _scrollController = ScrollController();
  late final AudioRecorder _recorder;

  @override
  void initState() {
    super.initState();
    _recorder = AudioRecorder();
    _loadSessionAndFetch();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _scrollToBottom();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _loadSessionAndFetch() async {
    final userId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
    log('Loading user ID: $userId');
    if (userId.isEmpty) {
      log('User ID is null or empty');
      return;
    }
    setState(() => _currentUserId = userId);
    log('Set current user ID: $_currentUserId');
    context.read<GetCommunityMessagesCubit>().getCommunityMessages();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUserId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommunityAppBar(),
          Expanded(
            child: BlocBuilder<GetCommunityMessagesCubit,
                GetCommunityMessagesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (messages) {
                    final sortedMessages = List<CommunityMessage>.from(
                        messages ?? [])
                      ..sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => _scrollToBottom());

                    if (sortedMessages.isEmpty) {
                      return const Center(child: Text("No messages yet"));
                    }
                    return BlocListener<DeleteMessageCubit,
                        delete_msg.DeleteMessageState>(
                      listener: (context, state) {
                        if (state is delete_msg.Success) {
                          context
                              .read<GetCommunityMessagesCubit>()
                              .removeMessageById(state.deletedId);
                          _scrollToBottom();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.greenAccent, size: 24),
                                  const SizedBox(width: 12),
                                  const Expanded(
                                      child: Text(
                                          'Message deleted successfully!')),
                                  IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.white),
                                    onPressed: () =>
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar(),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.black87,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 2),
                              elevation: 8,
                            ),
                          );
                        } else if (state is delete_msg.Error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  const Icon(Icons.error,
                                      color: Colors.redAccent, size: 24),
                                  const SizedBox(width: 12),
                                  Expanded(child: Text(state.error)),
                                  IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.white),
                                    onPressed: () =>
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar(),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.black87,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 2),
                              elevation: 8,
                            ),
                          );
                        }
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(top: 12, bottom: 4),
                        itemCount: sortedMessages.length,
                        reverse: false,
                        itemBuilder: (ctx, idx) {
                          final msg = sortedMessages[idx];
                          final isMe =
                              msg.senderId?.trim() == _currentUserId?.trim();
                          final timeString = msg.timestamp != null
                              ? DateFormat.jm().format(msg.timestamp!)
                              : '';

                          return isMe
                              ? SentMessageBubble(
                                  text: msg.message ?? '',
                                  time: timeString,
                                  images: msg.images,
                                  mediaUrl: msg.mediaUrl,
                                  mediaType: msg.mediaType,
                                  onLongPress: () async {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: 'Delete Message',
                                      desc:
                                          'Are you sure you want to delete this message?',
                                      btnCancelOnPress: () {},
                                      btnCancelText: 'Cancel',
                                      btnOkOnPress: () {
                                        context
                                            .read<DeleteMessageCubit>()
                                            .deleteMessage(msg.id!);
                                      },
                                      btnOkText: 'Delete',
                                      btnOkColor: Colors.redAccent,
                                      btnCancelColor: Colors.grey[400],
                                      headerAnimationLoop: false,
                                      dialogBackgroundColor: Colors.white,
                                      titleTextStyle: TextStyles
                                          .font20BlackSemiMedium
                                          .copyWith(color: Colors.redAccent),
                                      descTextStyle: TextStyles
                                          .font12BlackMedium
                                          .copyWith(fontSize: 14),
                                    ).show();
                                  },
                                )
                              : ReceivedMessageBubble(
                                  text: msg.message ?? '',
                                  time: timeString,
                                  avatarUrl: msg.userImage ??
                                      'assets/images/download.jpg',
                                  images: msg.images,
                                  mediaUrl: msg.mediaUrl,
                                  mediaType: msg.mediaType,
                                );
                        },
                      ),
                    );
                  },
                  error: (err) => Center(
                    child: Text(
                      err.message ?? 'Oops, something went wrong',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocListener<CreateMessageCubit, CreateMessageState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (response) {
                  if (response.success) {
                    setState(() {});
                    _scrollToBottom();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.message)),
                    );
                  }
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                },
                orElse: () {},
              );
            },
            child: MessageInputField(
              recorder: _recorder,
              onSend: (text) {
                if (text.trim().isNotEmpty) {
                  setState(() {});
                  context
                      .read<CreateMessageCubit>()
                      .createMessage(message: text);
                }
              },
              onSendImage: (images, localPaths) {
                if (images.isNotEmpty) {
                  setState(() {});
                  context
                      .read<CreateMessageCubit>()
                      .createMessage(images: images);
                }
              },
              onSendAudio: (audio, localPath) {
                setState(() {});
                context.read<CreateMessageCubit>().createMessage(audio: audio);
              },
            ),
          ),
        ],
      ),
    );
  }
}
