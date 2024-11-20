import 'package:care_nest/features/add_baby/data/models/get_all_babies_response.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class GetAllBabiesRepo {
  final ApiService _apiService;

  GetAllBabiesRepo(this._apiService);

  Future<ServerResult<GetAllBabiesResponse>> getAllBabies(String token) async {
    try {
      final response = await _apiService.getAllBabies(
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
