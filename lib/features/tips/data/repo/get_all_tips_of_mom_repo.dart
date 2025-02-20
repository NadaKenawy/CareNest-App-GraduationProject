import 'dart:developer';

import 'package:care_nest/core/networking/api_error_handler.dart';
import 'package:care_nest/core/networking/api_result.dart';
import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_mom_response.dart';

class GetAllTipsOfMomRepo {
  final ApiService _apiService;

  GetAllTipsOfMomRepo(this._apiService);

  Future<ApiResult<GetAllTipsOfMomResponse>> getAllTipsOfMom(
      String token) async {
    try {
      final response = await _apiService.getAllTipsOfMom(token);
      log('API Response: ${response.data}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
