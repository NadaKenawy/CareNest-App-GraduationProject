// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBotResponse _$ChatBotResponseFromJson(Map<String, dynamic> json) =>
    ChatBotResponse(
      advice: json['advice'] as String?,
      nextQuestion: json['next_question'] as String?,
      question: json['question'] as String?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ChatBotResponseToJson(ChatBotResponse instance) =>
    <String, dynamic>{
      'advice': instance.advice,
      'next_question': instance.nextQuestion,
      'question': instance.question,
      'message': instance.message,
      'error': instance.error,
    };
