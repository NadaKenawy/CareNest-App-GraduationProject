import 'dart:developer';
import 'dart:io';

import 'package:care_nest/features/profile/data/models/update_user_image_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class UpdateUserImageRepo {
  final Dio _dio;

  UpdateUserImageRepo(this._dio) {
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

  Future<ApiResult<UpdateUserImageResponse>> uploadImage(File imageFile) async {
    try {
      final token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      log("TOKEN USED: Bearer $token");

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

      final fileExtension = imageFile.path.split('.').last.toLowerCase();
      final mimeType = fileExtension == 'jpg' ? 'jpeg' : fileExtension;

      MultipartFile multipartFile = await MultipartFile.fromFile(
        imageFile.path,
        filename:
            'profile_${DateTime.now().millisecondsSinceEpoch}.$fileExtension',
        contentType: MediaType('image', mimeType),
      );

      FormData formData = FormData.fromMap({'image': multipartFile});

      final response = await _dio.put(
        'https://carenest-serverside.vercel.app/users/updateImage',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
            'Authorization': token,
          },
        ),
      );

      log("Status Code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      UpdateUserImageResponse updateUserImageResponse =
          UpdateUserImageResponse.fromJson(response.data);
      return ApiResult.success(updateUserImageResponse);
    } catch (error) {
      log("Upload Error: $error");
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
