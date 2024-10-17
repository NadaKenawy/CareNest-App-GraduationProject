import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ServerResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ServerResult.success(response);
    } catch (errro) {
      return ServerResult.failure(ServerErrorHandler.handle(errro));
    }
  }
}
