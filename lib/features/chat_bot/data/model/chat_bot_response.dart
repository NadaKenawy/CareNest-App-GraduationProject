import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_response.g.dart';

@JsonSerializable()
class ChatBotResponse {
  final String? advice;
  @JsonKey(name: 'next_question')
  final String? nextQuestion;
  final String? question;
  final String? message;
  final String? error;

  ChatBotResponse({
    this.advice,
    this.nextQuestion,
    this.question,
    this.message,
    this.error,
  });

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatBotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBotResponseToJson(this);
}
