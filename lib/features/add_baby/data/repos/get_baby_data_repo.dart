
import 'package:care_nest/features/add_baby/data/models/get_baby_data_response.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class GetBabyDataRepo {
  final ApiService _apiService;

  GetBabyDataRepo(this._apiService);

  Future<ServerResult<GetBabyDataResponse>> getBabyData(String token,String id) async {
    try {
      final response = await _apiService.getBabyData(
        token,
        id ,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
