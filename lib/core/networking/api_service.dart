import 'package:care_nest/core/networking/api_constants.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby_response.dart';

import 'package:care_nest/features/add_baby/data/models/delete_baby_response.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby_request.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby_response.dart';

import 'package:care_nest/features/forget_password/data/models/create_new_password_model/create_new_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_email_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_response.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_response.dart';
import 'package:care_nest/features/login/data/models/login_request_body.dart';
import 'package:care_nest/features/login/data/models/login_response.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_response.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/add_baby/data/models/add_baby_request_body.dart';
import '../../features/add_baby/data/models/get_all_babies_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPassResponse> forgetPassword(
    @Body() ForgetPassEmailRequestBody forgetPassEmailRequestBody,
  );

  @POST(ApiConstants.verifyPassword)
  Future<VerifyPasswordResponse> verifyPassword(
    @Body() VerifyPasswordRequestBody verifyPasswordRequestBody,
    @Header('Authorization') String token,
  );
  @PUT(ApiConstants.resetPassword)
  Future<void> createNewPassword(
    @Header('Authorization') String token,
    @Body() CreateNewPasswordRequestBody createNewPasswordRequestBody,
  );
  @POST(ApiConstants.verifyAccount)
  Future<VerifyAccountResponse> verifyAccount(
    @Body() VerifyAccountRequestBody verifyAccountRequestBody,
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.addNewBaby)
  Future<AddBabyResponse> addNewBaby(
    @Body() AddBabyRequestBody addBabyRequestBody,
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getAllBabies)
  Future<GetAllBabiesResponse> getAllBabies(
    @Header('Authorization') String token,
  );

  @DELETE(ApiConstants.deleteBaby)
  Future<DeleteBabyResponse> deleteBabyData(
    @Header('Authorization') String token,
    @Path('id') String id,
  );
    @PUT(ApiConstants.updateBaby)
  Future<UpdateBabyResponse> updateBabyData(
      @Body() UpdateBabyRequest updateBabyRequest,
    @Header('Authorization') String token,
    @Path('id') String id,
  );
}
