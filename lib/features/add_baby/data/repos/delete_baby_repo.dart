import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';
import '../models/delete_baby_response.dart';

class DeleteBabyRepo {
  final ApiService _apiService;

  DeleteBabyRepo(this._apiService);

  Future<ServerResult<DeleteBabyResponse>> deleteBaby(
      String token, String id) async {
    try {
      final deleteBabyResponse = await _apiService.deleteBabyData(token, id);
      return ServerResult.success(deleteBabyResponse);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
