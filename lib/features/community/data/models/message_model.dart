import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String userId;

  Message(this.message, this.userId);
  factory Message.fromjson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(data['message'], data['userId'] ?? '');
  }
}
