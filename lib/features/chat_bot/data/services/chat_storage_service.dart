import 'dart:convert';
import 'dart:developer';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/features/chat_bot/data/model/chat_message.dart';

class ChatStorageService {
  static const String _chatMessagesKey = 'chat_messages';
  static const String _userAgeKey = 'user_age';
  static const String _userLanguageKey = 'user_language';
  static const String _lastQuestionKey = 'last_question';
  static const int _maxMessages = 20;

  static Future<String> _getUserSpecificKey(String baseKey) async {
    try {
      String userId = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
      if (userId.isNotEmpty) {
        return '${baseKey}_$userId';
      }
      
      String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      if (token.isNotEmpty) {
        String tokenHash = token.hashCode.toString();
        return '${baseKey}_$tokenHash';
      }
            return baseKey;
    } catch (e) {
      log('Error getting user-specific key: $e');
      return baseKey;
    }
  }

  static Future<void> saveMessage(ChatMessage message) async {
    try {
      String userSpecificKey = await _getUserSpecificKey(_chatMessagesKey);
      List<ChatMessage> messages = await getMessages();
      messages.add(message);

      if (messages.length > _maxMessages) {
        messages = messages.sublist(messages.length - _maxMessages);
      }

      List<Map<String, dynamic>> messagesJson =
          messages.map((msg) => msg.toJson()).toList();

      await SharedPrefHelper.setData(
          userSpecificKey, jsonEncode(messagesJson));
    } catch (e) {
     log('Error saving message: $e');
    }
  }

  static Future<List<ChatMessage>> getMessages() async {
    try {
      String userSpecificKey = await _getUserSpecificKey(_chatMessagesKey);
      String messagesJson = await SharedPrefHelper.getString(userSpecificKey);

      if (messagesJson.isEmpty) {
        return [];
      }

      List<dynamic> messagesList = jsonDecode(messagesJson);
      List<ChatMessage> messages = messagesList
          .map((json) => ChatMessage.fromJson(json as Map<String, dynamic>))
          .toList();

      return messages;
    } catch (e) {
      log('Error getting messages: $e');
      return [];
    }
  }

  static Future<void> clearMessages() async {
    try {
      String userSpecificKey = await _getUserSpecificKey(_chatMessagesKey);
      String lastQuestionKey = await _getUserSpecificKey(_lastQuestionKey);
      await SharedPrefHelper.removeData(userSpecificKey);
      await SharedPrefHelper.removeData(lastQuestionKey);
    } catch (e) {
     log('Error clearing messages: $e');
    }
  }

  static Future<void> saveMessageFromMap(
      Map<String, dynamic> messageMap) async {
    try {
      final message = ChatMessage(
        text: messageMap['text'] ?? '',
        isBot: messageMap['isBot'] ?? false,
        timestamp: DateTime.now(),
      );
      await saveMessage(message);
    } catch (e) {
      log('Error saving message: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getMessagesAsMap() async {
    List<ChatMessage> messages = await getMessages();
    return messages
        .map((msg) => {
              'text': msg.text,
              'isBot': msg.isBot,
            })
        .toList();
  }

  static Future<void> saveUserPreferences(int age, String language) async {
    try {
      String userAgeKey = await _getUserSpecificKey(_userAgeKey);
      String userLanguageKey = await _getUserSpecificKey(_userLanguageKey);
      await SharedPrefHelper.setData(userAgeKey, age);
      await SharedPrefHelper.setData(userLanguageKey, language);
    } catch (e) {
      log('Error saving user preferences: $e');
    }
  }

  static Future<int?> getUserAge() async {
    try {
      String userAgeKey = await _getUserSpecificKey(_userAgeKey);
      return await SharedPrefHelper.getInt(userAgeKey);
    } catch (e) {
      log('Error getting user age: $e');
      return null;
    }
  }

  static Future<String?> getUserLanguage() async {
    try {
      String userLanguageKey = await _getUserSpecificKey(_userLanguageKey);
      String language = await SharedPrefHelper.getString(userLanguageKey);
      return language.isEmpty ? null : language;
    } catch (e) {
     log('Error getting user language: $e');
      return null;
    }
  }

  static Future<bool> hasUserPreferences() async {
    final age = await getUserAge();
    final language = await getUserLanguage();
    return age != null && language != null;
  }

  static Future<void> saveLastQuestion(String question) async {
    try {
      String lastQuestionKey = await _getUserSpecificKey(_lastQuestionKey);
      await SharedPrefHelper.setData(lastQuestionKey, question);
    } catch (e) {
     log('Error saving last question: $e');
    }
  }

  static Future<String?> getLastQuestion() async {
    try {
      String lastQuestionKey = await _getUserSpecificKey(_lastQuestionKey);
      String question = await SharedPrefHelper.getString(lastQuestionKey);
      return question.isEmpty ? null : question;
    } catch (e) {
      log('Error getting last question: $e');
      return null;
    }
  }

  static String? findLastQuestionFromMessages(
      List<Map<String, dynamic>> messages) {
    for (int i = messages.length - 1; i >= 0; i--) {
      final message = messages[i];
      if (message['isBot'] == true) {
        final text = message['text'] as String;
        if (text.contains('?') || text.contains('؟')) {
          return text;
        }
      }
    }
    return null;
  }
}
