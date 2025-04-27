import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/community/data/models/create_message/create_message_response.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class CreateMessageRepo {
  final ApiService _apiService;

  CreateMessageRepo(this._apiService);

  Future<ServerResult<CreateMessageResponse>> createMessage(
    FormData formData,
    String token,
  ) async {
    try {
      final response = await _apiService.createMessage(
        token,
        formData,
      );

      return ServerResult.success(response);
    } catch (error) {
      log('Error creating message: $error');
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
