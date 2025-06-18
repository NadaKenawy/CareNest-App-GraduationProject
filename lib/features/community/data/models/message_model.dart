import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String userId;
  final String? userImage;
  final DateTime timestamp;

  Message(this.message, this.userId, {this.userImage, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();

  factory Message.fromjson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(
      data['message'],
      data['userId'] ?? '',
      userImage: data['userImage'],
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userImage': userImage,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
