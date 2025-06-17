import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_request_body.g.dart';

@JsonSerializable()
class ChatBotRequestBody {
  final int age;
  final String language;
  @JsonKey(name: 'current_question')
  final String? currentQuestion;
  final String? answer;
  final Map<String, String>? answers;

  ChatBotRequestBody({
    required this.age,
    required this.language,
    this.currentQuestion,
    this.answer,
    this.answers,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'age': age,
      'language': language,
    };
    
    if (currentQuestion != null) {
      map['current_question'] = currentQuestion!;
    }
    
    map['answer'] = answer ?? '';
    
    if (answers != null) {
      map['answers'] = answers!;
    }
    
    return map;
  }
}
