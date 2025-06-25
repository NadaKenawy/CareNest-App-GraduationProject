import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import '../model/create_cry/create_cry_response_model.dart';

class CreateCryRepo {
  final ApiService _apiService;

  CreateCryRepo(this._apiService);

  Future<ApiResult<CreateCryResponse>> createCry(
    String token,
    File audioFile,
    String cryType,
  ) async {
    try {
      final fileExtension = audioFile.path.split('.').last.toLowerCase();
      String mimeType = 'audio/wav'; // default
      if (fileExtension == 'mp3') {
        mimeType = 'audio/mpeg';
      } else if (fileExtension == 'wav') {
        mimeType = 'audio/wav';
      }
      MultipartFile multipartFile = await MultipartFile.fromFile(
        audioFile.path,
        filename: audioFile.path.split('/').last,
        contentType: MediaType.parse(mimeType),
      );
      FormData formData = FormData.fromMap({
        'audio': multipartFile,
        'class': cryType,
      });
      final response = await _apiService.createCry(token, formData);
      log('CreateCryRepo API Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
