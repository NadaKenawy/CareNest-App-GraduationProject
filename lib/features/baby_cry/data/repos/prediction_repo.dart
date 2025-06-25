import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:care_nest/core/networking/api_result.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../model/prediction/prediction_response_model.dart';

class PredictionRepo {
  final Dio _dio;

  PredictionRepo(this._dio) {
    // إضافة PrettyDioLogger هنا
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

  Future<ApiResult<PredictionResponse>> uploadAudio(File audioFile) async {
    try {
      MultipartFile multipartFile = await MultipartFile.fromFile(
        audioFile.path,
        filename: audioFile.path.split('/').last,
      );

      FormData formData = FormData.fromMap({
        'file': multipartFile,
      });

      final response = await _dio.post(
        'https://pythonai.codepeak.software/predict',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Content-Length': audioFile.lengthSync().toString(),
          },
        ),
      );
      log("Status Code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      PredictionResponse predictionResponse =
          PredictionResponse.fromJson(response.data);
      return ApiResult.success(predictionResponse);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
