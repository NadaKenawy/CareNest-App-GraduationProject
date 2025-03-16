import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/doctors/data/models/get_hospitals/get_hospitals_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class GetHospitalsRepo {
  final ApiService _apiService;

  GetHospitalsRepo(this._apiService);

  Future<ApiResult<GetHospitalsResponse>> getHospitals(
      double longitude, double latitude, String token) async {
    try {
      final response = await _apiService.getAllHospitals(token, longitude, latitude);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
