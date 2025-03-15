import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class GetDoctorsRepo {
  final ApiService _apiService;

  GetDoctorsRepo(this._apiService);

  Future<ApiResult<GetDoctorsResponse>> getDoctors(
      double longitude, double latitude, String token) async {
    try {
      final response =
          await _apiService.getAllDoctors(token, longitude, latitude);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
