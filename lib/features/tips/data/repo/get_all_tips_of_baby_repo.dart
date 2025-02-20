import 'dart:developer';

import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_baby_response.dart';

class GetAllTipsOfBabyRepo {
  final ApiService _apiService;

  GetAllTipsOfBabyRepo(this._apiService);

  Future<ApiResult<GetAllTipsOfBabyResponse>> getAllTipsOfBaby(
      String token) async {
    try {
      final response = await _apiService.getAllTipsOfBaby(token);
      log('API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
