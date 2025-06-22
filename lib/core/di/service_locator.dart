import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/data/repos/delete_baby_repo.dart';
import 'package:care_nest/features/add_baby/data/repos/get_all_babies_repo.dart';
import 'package:care_nest/features/add_baby/data/repos/update_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_cubit.dart';
import 'package:care_nest/features/baby_cry/data/repos/prediction_repo.dart';
import 'package:care_nest/features/baby_cry/logic/cubit/prediction_cubit.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_response.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_height_growth_repo.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_weight_growth_repo.dart';
import 'package:care_nest/features/baby_growth/data/repos/latest_growth_data_repo.dart';
import 'package:care_nest/features/baby_growth/data/repos/put_growth_data_repo.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_cubit.dart';
import 'package:care_nest/features/chat_bot/data/repo/chat_bot_repo.dart';
import 'package:care_nest/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:care_nest/features/community/data/repos/create_message_repo.dart';
import 'package:care_nest/features/community/data/repos/get_community_messages_repo.dart';
import 'package:care_nest/features/community/logic/create_message/create_message_cubit.dart';
import 'package:care_nest/features/community/logic/get_community_messages/get_community_messages_cubit.dart';
import 'package:care_nest/features/doctors/data/repos/cancel_booked_appointment_repo.dart';
import 'package:care_nest/features/doctors/data/repos/doctor_booking_repo.dart';
import 'package:care_nest/features/doctors/data/repos/doctor_review_repo.dart';
import 'package:care_nest/features/doctors/data/repos/get_booked_appointments_repo.dart';
import 'package:care_nest/features/doctors/data/repos/get_doctors_repo.dart';
import 'package:care_nest/features/doctors/data/repos/get_hospitals_repo.dart';
import 'package:care_nest/features/doctors/logic/book_doctor_cubit/doctor_booking_cubit.dart';
import 'package:care_nest/features/doctors/logic/cancel_booked_appointment_cubit/cancel_booked_appointment_cubit.dart';
import 'package:care_nest/features/doctors/logic/create_review/doctor_review_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_hospitals_cubit/get_all_hospitals_cubit.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/logic/get_music_cubit/get_music_cubit.dart';
import 'package:care_nest/features/entertainment/fun_videos/data/repo/get_all_channels_repo.dart';
import 'package:care_nest/features/entertainment/fun_videos/logic/get_all_channels_cubit.dart';
import 'package:care_nest/features/entertainment/short_stories/data/repo/get_all_stories_repo.dart';
import 'package:care_nest/features/entertainment/short_stories/logic/get_all_stories_cubit.dart';
import 'package:care_nest/features/fcm/data/repos/get_all_notifications_repo.dart';
import 'package:care_nest/features/fcm/data/repos/notification_repo.dart';
import 'package:care_nest/features/fcm/data/repos/update_fcm_repo.dart';
import 'package:care_nest/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_cubit.dart';
import 'package:care_nest/features/fcm/logic/update_fcm_cubit/update_fcm_cubit.dart';
import 'package:care_nest/features/forget_password/data/repos/create_new_password.dart';
import 'package:care_nest/features/forget_password/data/repos/forget_pass_repo.dart';
import 'package:care_nest/features/forget_password/data/repos/verify_password_repo.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/login/data/repos/login_repo.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/data/repos/add_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/medications/data/repos/delete_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/medications/data/repos/get_all_babies_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/medications/data/repos/update_medication_schedule_repo.dart';
import 'package:care_nest/features/reminders/medications/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/delete_medication_schedule_cubit/delete_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/update_medication_schedule_cubit/update_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/data/repo/get_baby_vaccines_repo.dart';
import 'package:care_nest/features/reminders/vaccinations/data/repo/mark_vaccine_repo.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_cubit.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/data/repos/verify_account_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/tips/data/repo/get_all_tips_of_baby_repo.dart';
import 'package:care_nest/features/tips/data/repo/get_all_tips_of_mom_repo.dart';
import 'package:care_nest/features/tips/data/repo/get_tip_details_repo.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_baby_cubit/get_all_tips_of_baby_cubit.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_mom_cubit/get_all_tips_of_mom_cubit.dart';
import 'package:care_nest/features/tips/logic/get_tip_details_cubit/get_tip_details_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/add_baby/data/repos/add_baby_repo.dart';
import '../../features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import '../../features/community/data/repos/get_online_users_repo.dart';
import '../../features/community/logic/get_online_users/get_online_users_cubit.dart';
import '../../features/doctors/logic/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import '../../features/entertainment/music_and_sweet_noise/data/repos/get_music_repo.dart';
import '../../features/entertainment/music_and_sweet_noise/data/repos/get_white_noise_repo.dart';
import '../../features/entertainment/music_and_sweet_noise/logic/get_white_noise/get_white_noise_cubit.dart';
import '../../features/profile/data/repos/update_user_image_repo.dart';
import '../../features/profile/data/repos/update_user_repo.dart';
import '../../features/profile/logic/update_user_cubit/update_user_cubit.dart';
import '../../features/profile/logic/update_user_image_cubit/update_user_image_cubit.dart';
import '../../features/reminders/medications/data/repos/get_all_medication_schedule_repo.dart';
import '../../features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import '../../features/setting/data/repos/create_report_repo.dart';
import '../../features/setting/data/repos/get_feedbacks_repo.dart';
import '../../features/setting/data/repos/update_pass_repo.dart';
import '../../features/setting/data/repos/update_report_repo.dart';
import '../../features/setting/logic/create_report_cubit/create_report_cubit.dart';
import '../../features/setting/logic/get_feedbacks_cubit/get_feedbacks_cubit.dart';
import '../../features/setting/logic/update_pass_cubit/update_pass_cubit.dart';
import '../../features/setting/logic/update_report_cubit/update_report_cubit.dart';
import '../logic/user_cubit/user_cubit.dart';
import 'package:care_nest/features/community/data/repos/delete_message_repo.dart';
import 'package:care_nest/features/community/logic/delete_message/delete_message_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<UserCubit>(() => UserCubit());
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt(), getIt<UserCubit>()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // forget password
  getIt.registerLazySingleton<ForgetPassRepo>(() => ForgetPassRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));

  // verify password
  getIt.registerLazySingleton<VerifyPasswordRepo>(
      () => VerifyPasswordRepo(getIt()));
  getIt
      .registerFactory<VerifyPasswordCubit>(() => VerifyPasswordCubit(getIt()));

  // create new password
  getIt.registerLazySingleton<CreateNewPasswordRepo>(
      () => CreateNewPasswordRepo(getIt()));
  getIt.registerFactory<CreateNewPasswordCubit>(
      () => CreateNewPasswordCubit(getIt()));

  // verify account
  getIt.registerLazySingleton<VerifyAccountRepo>(
      () => VerifyAccountRepo(getIt()));
  getIt.registerFactory<VerifyAccountCubit>(() => VerifyAccountCubit(getIt()));

  // add baby
  getIt.registerLazySingleton<AddBabyRepo>(() => AddBabyRepo(getIt()));
  getIt.registerFactory<AddBabyCubit>(() => AddBabyCubit(getIt()));

  //get all babies
  getIt
      .registerLazySingleton<GetAllBabiesRepo>(() => GetAllBabiesRepo(getIt()));
  getIt.registerFactory<GetAllBabiesCubit>(() => GetAllBabiesCubit(getIt()));

  // delete baby
  getIt.registerLazySingleton<DeleteBabyRepo>(() => DeleteBabyRepo(getIt()));
  getIt.registerFactory<DeleteBabyCubit>(() => DeleteBabyCubit(getIt()));

  // update baby
  getIt.registerLazySingleton<UpdateBabyRepo>(() => UpdateBabyRepo(getIt()));
  getIt.registerFactory<UpdateBabyCubit>(
      () => UpdateBabyCubit(getIt(), BabiesData()));

  //get all medication schedule
  getIt.registerLazySingleton<GetAllMedicationScheduleRepo>(
      () => GetAllMedicationScheduleRepo(getIt()));
  getIt.registerFactory<GetAllMedicationScheduleCubit>(
      () => GetAllMedicationScheduleCubit(getIt()));

  // add medication schedule
  getIt.registerLazySingleton<AddMedicationScheduleRepo>(
      () => AddMedicationScheduleRepo(getIt()));
  getIt.registerFactory<AddMedicationScheduleCubit>(
      () => AddMedicationScheduleCubit(getIt()));

  // update medication schedule
  getIt.registerLazySingleton<UpdateMedicationScheduleRepo>(
      () => UpdateMedicationScheduleRepo(getIt()));
  getIt.registerFactory<UpdateMedicationScheduleCubit>(
      () => UpdateMedicationScheduleCubit(getIt(), MedicationData()));

  getIt.registerLazySingleton<UpdateFcmRepo>(() => UpdateFcmRepo(getIt()));
  getIt.registerFactory<UpdateFcmCubit>(() => UpdateFcmCubit(getIt()));

  // delete medication schedule
  getIt.registerLazySingleton<DeleteMedicationScheduleRepo>(
      () => DeleteMedicationScheduleRepo(getIt()));
  getIt.registerFactory<DeleteMedicationScheduleCubit>(
      () => DeleteMedicationScheduleCubit(getIt()));

  //get all babies medication schedule
  getIt.registerLazySingleton<GetAllBabiesMedicationScheduleRepo>(
      () => GetAllBabiesMedicationScheduleRepo(getIt()));
  getIt.registerFactory<GetAllBabiesMedicationScheduleCubit>(
      () => GetAllBabiesMedicationScheduleCubit(getIt()));

  // get all notification
  getIt.registerLazySingleton<GetAllNotificationsRepo>(
      () => GetAllNotificationsRepo(getIt()));
  getIt.registerFactory<GetAllNotificationsCubit>(
      () => GetAllNotificationsCubit(getIt()));

// delete notifications
  getIt.registerLazySingleton<NotificationsRepo>(
      () => NotificationsRepo(getIt()));
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));

  //get baby vaccines

  getIt.registerLazySingleton<GetBabyVaccinesRepo>(
      () => GetBabyVaccinesRepo(getIt()));
  getIt.registerFactory<GetBabyVaccinesCubit>(
      () => GetBabyVaccinesCubit(getIt()));

  //mark vaccines
  getIt.registerLazySingleton<MarkVaccineRepo>(() => MarkVaccineRepo(getIt()));
  getIt.registerFactory<MarkVaccineCubit>(() => MarkVaccineCubit(getIt()));

  //get baby height growth data
  getIt.registerLazySingleton<GetBabyHeightGrowthRepo>(
      () => GetBabyHeightGrowthRepo(getIt()));
  getIt.registerFactory<GetBabyHeightGrowthCubit>(
      () => GetBabyHeightGrowthCubit(getIt()));

  //get baby weight growth data
  getIt.registerLazySingleton<GetBabyWeightGrowthRepo>(
      () => GetBabyWeightGrowthRepo(getIt()));
  getIt.registerFactory<GetBabyWeightGrowthCubit>(
      () => GetBabyWeightGrowthCubit(getIt()));

  //put baby growth data
  getIt.registerLazySingleton<PutGrowthDataRepo>(
      () => PutGrowthDataRepo(getIt()));
  getIt.registerFactory<PutGrowthDataCubit>(
      () => PutGrowthDataCubit(getIt(), BabyData()));

  //latest growth data
  getIt.registerLazySingleton<LatestGrowthDataRepo>(
      () => LatestGrowthDataRepo(getIt()));
  getIt.registerFactory<LatestGrowthDataCubit>(
      () => LatestGrowthDataCubit(getIt()));

//get all tips of baby
  getIt.registerLazySingleton<GetAllTipsOfBabyRepo>(
      () => GetAllTipsOfBabyRepo(getIt()));
  getIt.registerFactory<GetAllTipsOfBabyCubit>(
      () => GetAllTipsOfBabyCubit(getIt()));

  //get all tips of mom
  getIt.registerLazySingleton<GetAllTipsOfMomRepo>(
      () => GetAllTipsOfMomRepo(getIt()));
  getIt.registerFactory<GetAllTipsOfMomCubit>(
      () => GetAllTipsOfMomCubit(getIt()));

  //get  tip details
  getIt.registerLazySingleton<GetTipDetailsRepo>(
      () => GetTipDetailsRepo(getIt()));
  getIt.registerFactory<GetTipDetailsCubit>(() => GetTipDetailsCubit(getIt()));

  // get music repo
  getIt.registerLazySingleton<GetMusicRepo>(() => GetMusicRepo(getIt()));
  // get music cubit
  getIt.registerFactory<GetMusicCubit>(() => GetMusicCubit(getIt()));

  // get white noise repo
  getIt.registerLazySingleton<GetWhiteNoiseRepo>(
      () => GetWhiteNoiseRepo(getIt()));
  // get white noise cubit
  getIt.registerFactory<GetWhiteNoiseCubit>(() => GetWhiteNoiseCubit(getIt()));

  //get all stories
  getIt.registerLazySingleton<GetAllStoriesRepo>(
      () => GetAllStoriesRepo(getIt()));
  getIt.registerFactory<GetAllStoriesCubit>(() => GetAllStoriesCubit(getIt()));

  // get all channels
  getIt.registerLazySingleton<GetAllChannelsRepo>(
      () => GetAllChannelsRepo(getIt()));
  getIt
      .registerFactory<GetAllChannelsCubit>(() => GetAllChannelsCubit(getIt()));

  // get all doctors
  getIt.registerLazySingleton<GetDoctorsRepo>(() => GetDoctorsRepo(getIt()));
  getIt.registerFactory<GetAllDoctorsCubit>(() => GetAllDoctorsCubit(getIt()));
  // get all doctors
  getIt
      .registerLazySingleton<GetHospitalsRepo>(() => GetHospitalsRepo(getIt()));
  getIt.registerFactory<GetAllHospitalsCubit>(
      () => GetAllHospitalsCubit(getIt()));

  //prediction
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<PredictionRepo>(
      () => PredictionRepo(getIt<Dio>()));

  getIt.registerFactory<PredictionCubit>(
      () => PredictionCubit(getIt<PredictionRepo>()));

  //doctor booking
  getIt.registerLazySingleton<DoctorBookingRepo>(
      () => DoctorBookingRepo(getIt()));
  getIt.registerFactory<DoctorBookingCubit>(() => DoctorBookingCubit(getIt()));

  // get all booked appointments
  getIt.registerLazySingleton<GetBookedAppointmentsRepo>(
      () => GetBookedAppointmentsRepo(getIt()));
  getIt.registerFactory<GetBookedAppointmentsCubit>(
      () => GetBookedAppointmentsCubit(getIt()));
  // cancel booked appointments
  getIt.registerLazySingleton<CancelBookedAppointmentRepo>(
      () => CancelBookedAppointmentRepo(getIt()));
  getIt.registerFactory<CancelBookedAppointmentCubit>(
      () => CancelBookedAppointmentCubit(getIt()));

  // create review
  getIt
      .registerLazySingleton<DoctorReviewRepo>(() => DoctorReviewRepo(getIt()));
  getIt.registerFactory<DoctorReviewCubit>(() => DoctorReviewCubit(getIt()));

  // update user
  getIt.registerLazySingleton<UpdateUserRepo>(() => UpdateUserRepo(getIt()));
  getIt.registerFactory<UpdateUserCubit>(() => UpdateUserCubit(getIt()));

  //update user image

  getIt.registerLazySingleton<UpdateUserImageRepo>(
    () => UpdateUserImageRepo(getIt<Dio>()),
  );

  getIt.registerFactory<UpdateUserImageCubit>(
    () => UpdateUserImageCubit(getIt<UpdateUserImageRepo>()),
  );

  //get community messages
  getIt.registerLazySingleton<GetCommunityMessagesRepo>(
      () => GetCommunityMessagesRepo(getIt()));
  getIt.registerFactory<GetCommunityMessagesCubit>(
      () => GetCommunityMessagesCubit(getIt()));

  //create messages
  getIt.registerLazySingleton<CreateMessageRepo>(
      () => CreateMessageRepo(getIt()));
  getIt.registerFactory<CreateMessageCubit>(
      () => CreateMessageCubit(getIt(), getIt<GetCommunityMessagesCubit>()));

  // delete message
  getIt.registerLazySingleton<DeleteMessageRepo>(
      () => DeleteMessageRepo(getIt()));
  getIt.registerFactory<DeleteMessageCubit>(() => DeleteMessageCubit(getIt()));

  //get online users
  getIt.registerLazySingleton<GetOnlineUsersRepo>(
      () => GetOnlineUsersRepo(getIt()));
  getIt
      .registerFactory<GetOnlineUsersCubit>(() => GetOnlineUsersCubit(getIt()));


  //CreateReport
  getIt.registerLazySingleton<CreateReportRepo>(
    () => CreateReportRepo(getIt()),
  );
  getIt.registerFactory<CreateReportCubit>(() => CreateReportCubit(getIt()));

  //updateReport
  getIt.registerLazySingleton<UpdateReportRepo>(
    () => UpdateReportRepo(getIt()),
  );
  getIt.registerFactory<UpdateReportCubit>(() => UpdateReportCubit(getIt()));

//chat bot
  getIt.registerLazySingleton<ChatBotRepo>(
      () => ChatBotRepo(getIt()));
  getIt
      .registerFactory<ChatBotCubit>(() => ChatBotCubit(getIt()));

  //update password
  getIt.registerLazySingleton<UpdatePassRepo>(
    () => UpdatePassRepo(getIt()),
  );
  getIt.registerFactory<UpdatePassCubit>(
    () => UpdatePassCubit(getIt()),
  );

  //get feedbacks
  getIt.registerLazySingleton<GetFeedbacksRepo>(
    () => GetFeedbacksRepo(getIt()),
  );
  getIt.registerFactory<GetFeedbacksCubit>(
    () => GetFeedbacksCubit(getIt()),
  );

}
