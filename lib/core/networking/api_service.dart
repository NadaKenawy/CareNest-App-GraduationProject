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
import 'package:care_nest/features/community/data/models/create_message/create_message_response.dart';
import 'package:care_nest/features/doctors/data/models/book_doctor/book_doctor_request_body.dart';
import 'package:care_nest/features/doctors/data/models/book_doctor/book_doctor_response.dart';
import 'package:care_nest/features/doctors/data/models/booked_appointments/get_booked_appointments_response.dart';
import 'package:care_nest/features/doctors/data/models/cancel_booked_appointment/cancel_booked_appointment_response.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_request_body.dart';
import 'package:care_nest/features/doctors/data/models/create_review/review_response.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/data/models/get_hospitals/get_hospitals_response.dart';
import 'package:care_nest/features/entertainment/fun_videos/data/model/get_all_channels_response.dart';
import 'package:care_nest/features/entertainment/short_stories/data/models/get_all_stories_response.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_music_response.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/data/models/get_white_noise_response.dart';
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
import 'package:care_nest/features/tips/data/models/get_all_tips_of_baby_response.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_mom_response.dart';
import 'package:care_nest/features/tips/data/models/get_tip_details_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/add_baby/data/models/add_baby/add_baby_request_body.dart';
import '../../features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import '../../features/community/data/models/get_online_users/get_online_users_response.dart';
import '../../features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';
import '../../features/profile/data/models/update_user_request_body.dart';
import '../../features/profile/data/models/update_user_response.dart';
import 'package:care_nest/features/community/data/models/delete_message/delete_message_response.dart';

import '../../features/setting/feedback/data/models/create_report/create_report_request_body.dart';
import '../../features/setting/feedback/data/models/create_report/create_report_response.dart';
import '../../features/setting/feedback/data/models/get_feedback/get_feedbacks_response.dart';
import '../../features/setting/change_password/data/models/update_pass_request_body.dart';
import '../../features/setting/change_password/data/models/update_pass_response.dart';
import '../../features/setting/feedback/data/models/update_report/update_report_request_body.dart';
import '../../features/setting/feedback/data/models/update_report/update_report_response.dart';
import 'package:care_nest/features/baby_cry/data/model/create_cry/create_cry_response_model.dart';
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

  @GET(ApiConstants.getAllTipsOfBaby)
  Future<GetAllTipsOfBabyResponse> getAllTipsOfBaby(
    @Header('Authorization') String token,
  );
  @GET(ApiConstants.getAllTipsOfMom)
  Future<GetAllTipsOfMomResponse> getAllTipsOfMom(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getTipDetails)
  Future<GetTipDetailsResponse> getTipDetails(
    @Header('Authorization') String token,
    @Path('id') String tipId,
  );

  @GET(ApiConstants.getMusic)
  Future<MusicResponse> getMusic(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getWhiteNoise)
  Future<WhiteNoiseResponse> getWhiteNoise(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getAllStories)
  Future<GetAllStoriesResponse> getAllStories(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getAllChannels)
  Future<GetAllChannelsResponse> getAllChannels(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getAllDoctors)
  Future<GetDoctorsResponse> getAllDoctors(
    @Header('Authorization') String token,
    @Query('lng') double longitude,
    @Query('lat') double latitude,
  );
  @GET(ApiConstants.getAllHospitals)
  Future<GetHospitalsResponse> getAllHospitals(
    @Header('Authorization') String token,
    @Query('lng') double longitude,
    @Query('lat') double latitude,
  );
  @POST(ApiConstants.bookDoctor)
  Future<BookDoctorResponse> bookDoctor(
    @Body() BookDoctorRequestBody bookDoctorRequestBody,
    @Header('Authorization') String token,
  );
  @GET(ApiConstants.bookedAppointments)
  Future<GetBookedAppointmentsResponse> getBookedAppointments(
    @Header('Authorization') String token,
  );

  @DELETE(ApiConstants.cancelbookedAppointment)
  Future<CancelBookedAppointmentResponse> cancelBookedAppointment(
    @Header('Authorization') String token,
    @Path('id') String id,
  );

  @POST(ApiConstants.createReview)
  Future<ReviewResponse> submitReview(
    @Body() ReviewRequestBody reviewRequestBody,
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.updateUser)
  Future<UpdateUserResponse> updateUser(
    @Header('Authorization') String token,
    @Body() UpdateUserRequestBody updateUserRequestBody,
  );

  @GET(ApiConstants.getCommunityMessages)
  Future<List<Map<String, dynamic>>> getCommunityMessages(
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.createMessage)
  Future<CreateMessageResponse> createMessage(
    @Header('Authorization') String token,
    @Body() FormData formData,
  );

  @DELETE(ApiConstants.deleteCommunityMessage)
  Future<DeleteMessageResponse> deleteCommunityMessage(
    @Header('Authorization') String token,
    @Path('id') String messageId,
  );

  @GET(ApiConstants.getCommunityOnlineUsers)
  Future<GetOnlineUsersResponse> getCommunityOnlineUsers(
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.createReport)
  Future<CreateReportResponse> createReport(
    @Header('Authorization') String token,
    @Body() CreateReportRequestBody createReportRequestBody,
  );

  @PUT(ApiConstants.updateReport)
  Future<UpdateReportResponse> updateReport(
    @Header('Authorization') String token,
    @Body() UpdateReportRequestBody updateReportRequestBody,
  );

  @PUT(ApiConstants.updatePassword)
  Future<UpdatePassResponse> updatePassword(
    @Header('Authorization') String token,
    @Body() UpdatePassRequestBody updatePassRequestBody,
  );

  @GET(ApiConstants.getFeedbacks)
  Future<GetFeedbacksResponse> getFeedbacks(
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.createCry)
  Future<CreateCryResponse> createCry(
    @Header('Authorization') String token,
    @Body() FormData formData,
  );
}
