import 'package:care_nest/core/networking/api_service.dart';
import '../model/user_satisfaction/user_satisfaction_request_body.dart';
import '../model/user_satisfaction/user_satisfaction_response_model.dart';

class UserSatisfactionRepo {
  final ApiService apiService;
  UserSatisfactionRepo(this.apiService);

  Future<UserSatisfactionResponseModel> setUserSatisfaction({
    required String cryId,
    required UserSatisfactionRequestBody requestBody,
    required String token,
  }) async {
    return await apiService.setCryUserSatisfaction(cryId, requestBody, token);
  }
}
