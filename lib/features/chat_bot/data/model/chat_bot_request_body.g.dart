// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBotRequestBody _$ChatBotRequestBodyFromJson(Map<String, dynamic> json) =>
    ChatBotRequestBody(
      age: (json['age'] as num).toInt(),
      language: json['language'] as String,
      currentQuestion: json['current_question'] as String?,
      answer: json['answer'] as String?,
      answers: (json['answers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ChatBotRequestBodyToJson(ChatBotRequestBody instance) =>
    <String, dynamic>{
      'age': instance.age,
      'language': instance.language,
      'current_question': instance.currentQuestion,
      'answer': instance.answer,
      'answers': instance.answers,
    };
