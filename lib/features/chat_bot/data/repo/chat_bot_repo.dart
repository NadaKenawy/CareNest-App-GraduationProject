import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_error_handler.dart';
import '../model/chat_bot_request_body.dart';
import '../model/chat_bot_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ChatBotRepo {
  final Dio _dio;

  ChatBotRepo(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    );
  }

  Future<ApiResult<ChatBotResponse>> askQuestion(ChatBotRequestBody requestBody) async {
    try {
      final response = await _dio.post(
        'https://child-amd9ewetewc6aygz.polandcentral-01.azurewebsites.net/chat',
        data: requestBody.toJson(),
      );

      log("Status Code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      final chatbotResponse = ChatBotResponse.fromJson(response.data);
      return ApiResult.success(chatbotResponse);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
