import 'dart:developer';

import 'package:care_nest/core/networking/api_constants.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby/add_baby_response.dart';
import 'package:care_nest/features/add_baby/data/models/delete_baby/delete_baby_response.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby/update_baby_request.dart';
import 'package:care_nest/features/add_baby/data/models/update_baby/update_baby_response.dart';
import 'package:care_nest/features/baby_growth/data/models/get_baby_height_growth/get_baby_height_growth_response.dart';
import 'package:care_nest/features/baby_growth/data/models/get_baby_weight_growth/get_baby_weight_growth_response.dart';
import 'package:care_nest/features/baby_growth/data/models/latest_growth_data/latest_growth_data_response.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_request.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_response.dart';
import 'package:care_nest/features/fcm/data/models/delete_all_notifications/delete_all_notifications_response.dart';
import 'package:care_nest/features/fcm/data/models/delete_notification/delete_notification_response.dart';
import 'package:care_nest/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:care_nest/features/fcm/data/models/update_fcm/update_fcm_response.dart';
import 'package:care_nest/features/forget_password/data/models/create_new_password_model/create_new_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_email_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/forget_password_model/forget_pass_response.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_request_body.dart';
import 'package:care_nest/features/forget_password/data/models/verify_password_model/verify_password_response.dart';
import 'package:care_nest/features/login/data/models/login_request_body.dart';
import 'package:care_nest/features/login/data/models/login_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/delete_medication_schedule/delete_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_babies_medication_schedule/get_all_babies_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/add_medication_schedule/add_medication_schedule_request_body.dart';
import 'package:care_nest/features/reminders/medications/data/models/add_medication_schedule/add_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/models/update_medication_schedule/update_medication_schedule_request.dart';
import 'package:care_nest/features/reminders/medications/data/models/update_medication_schedule/update_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/mark_vaccine_response.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/sign_up_model/sign_up_response.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_request_body.dart';
import 'package:care_nest/features/sign_up/data/models/verify_account_model/verify_account_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../features/add_baby/data/models/add_baby/add_baby_request_body.dart';
import '../../features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import '../../features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';
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

  @GET(ApiConstants.getAllMedicationSchedule)
  Future<GetAllMedicationScheduleResponse> getAllMedicationSchedule(
    @Header('Authorization') String token,
    @Path('id') String id,
  );

  @POST(ApiConstants.addMedicationSchedule)
  Future<AddMedicationScheduleResponse> addMedicationSchedule(
    @Path('babyId') String babyId,
    @Body() AddMedicationScheduleRequestBody medicationScheduleRequestBody,
    @Header('Authorization') String token,
  );
  @PUT(ApiConstants.updateMedicationSchedule)
  Future<UpdateMedicationScheduleResponse> updateMedicationSchedule(
    @Path("id") String id,
    @Path("scheduleId") String scheduleId,
    @Header("Authorization") String token,
    @Body() UpdateMedicationScheduleRequest updateMedicationScheduleRequest,
  );

  @PUT(ApiConstants.updateFcmToken)
  Future<UpdateFcmResponse> updateFcmToken(
    @Header('Authorization') String token,
    @Body() UpdateFcmTokenRequestBody updateFcmTokenRequestBody,
  );

  @DELETE(ApiConstants.deleteMedicationSchedule)
  Future<DeleteMedicationScheduleResponse> deleteMedicationSchedule(
    @Header("Authorization") String token,
    @Path("id") String id,
    @Path("scheduleId") String scheduleId,
  );

  @GET(ApiConstants.getAllBabiesMedicationSchedule)
  Future<GetAllBabiesMedicationScheduleResponse> getAllBabiesMedicationSchedule(
    @Header('Authorization') String token,
  );
  @GET(ApiConstants.getAllNotifications)
  Future<GetAllNotificationsResponse> getAllNotifications(
    @Header('Authorization') String token,
  );

  @DELETE(ApiConstants.deleteNotification)
  Future<DeleteNotificationResponse> deleteNotification(
    @Header('Authorization') String token,
    @Path("id") String id,
  );

  @DELETE(ApiConstants.deleteAllNotifications)
  Future<DeleteAllNotificationsResponse> deleteAllNotifications(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getBabyVaccines)
  Future<GetBabyVaccinesResponse> getBabyVaccines(
    @Header('Authorization') String token,
    @Path('id') String id,
  );

  @PUT(ApiConstants.markVaccine)
  Future<MarkVaccineResponse> markVaccine(
    @Header("Authorization") String token,
    @Path("babyId") String babyId,
    @Path("id") String vaccineId,
  );

  @GET(ApiConstants.getHeightGrowth)
  Future<BabyHeightGrowthResponse> getHeightGrowthData(
    @Header('Authorization') String token,
    @Path('babyid') String babyid,
  );

  @GET(ApiConstants.getWeightGrowth)
  Future<BabyWeightGrowthResponse> getWeightGrowthData(
    @Header('Authorization') String token,
    @Path('babyid') String babyid,
  );
  @PUT(ApiConstants.putGrowthData)
  Future<PutGrowthDataResponse> putGrowthData(
    @Body() PutGrowthDataRequest putGrowthDataRequest,
    @Header("Authorization") String token,
    @Path('id') String id,
  );

  @GET(ApiConstants.latestGrowthData)
  Future<LatestGrowthDataResponse> getLatestGrowthData(
    @Header('Authorization') String token,
    @Path('id') String id,
  );
}

class ParseErrorLogger {
  void logError(
      Object error, StackTrace stackTrace, RequestOptions requestOptions) {
    log('Error: $error\nStacktrace: $stackTrace\nRequestOptions: $requestOptions');
  }
}
