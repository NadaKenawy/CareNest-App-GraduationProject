import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  StreamSubscription? _messagesSubscription;

  void sendMessage({required String msg}) async {
    final userId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
    final userImage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userImage);
    messages.add({
      'message': msg,
      'userId': userId,
      'userImage': userImage,
      'timestamp': DateTime.now(),
    });
  }

  void getMessage() {
    _messagesSubscription?.cancel(); 
    _messagesSubscription = messages
        .orderBy('timestamp', descending: true)
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
    _messagesSubscription?.cancel(); 
    return super.close();
  }
}
