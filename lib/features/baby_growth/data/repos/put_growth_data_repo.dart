import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_request.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_response.dart';

class PutGrowthDataRepo {
  final ApiService _apiService;

  PutGrowthDataRepo(this._apiService);

  Future<ServerResult<PutGrowthDataResponse>> putGrowthData(
    PutGrowthDataRequest putGrowthDataRequest,
    String token,
    String id,
  ) async {
    try {
      final response = await _apiService.putGrowthData(
        putGrowthDataRequest,
        token,
        id,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
