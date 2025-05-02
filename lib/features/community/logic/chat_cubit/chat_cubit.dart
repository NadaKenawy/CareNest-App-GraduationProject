import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  StreamSubscription? _messagesSubscription; // Add this

  void sendMessage({required String msg}) async {
    String userId = await SharedPrefHelper.getOrCreateUserId();
    messages.add({
      'message': msg,
      'userId': userId,
      'createdAt': DateTime.now(),
    });
  }

  void getMessage() {
    _messagesSubscription?.cancel(); // Cancel any existing subscription
    _messagesSubscription = messages
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromjson(doc));
      }
      emit(ChatSuccess());
    });
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel(); // Cancel when Cubit closes
    return super.close();
  }
}
