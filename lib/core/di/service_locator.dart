import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/data/repos/delete_baby_repo.dart';
import 'package:care_nest/features/add_baby/data/repos/get_all_babies_repo.dart';
import 'package:care_nest/features/add_baby/data/repos/update_baby_repo.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_cubit.dart';
import 'package:care_nest/features/baby_growth/data/models/put_growth_data/put_growth_data_response.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_height_growth_repo.dart';
import 'package:care_nest/features/baby_growth/data/repos/get_baby_weight_growth_repo.dart';
import 'package:care_nest/features/baby_growth/data/repos/put_growth_data_repo.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_cubit.dart';
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
import 'package:care_nest/features/reminders/vaccinations/data/repo/get_baby_vaccines_respo.dart';
import 'package:care_nest/features/reminders/vaccinations/data/repo/mark_vaccine_repo.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_cubit.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/data/repos/verify_account_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_baby/data/repos/add_baby_repo.dart';
import '../../features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import '../../features/reminders/medications/data/repos/get_all_medication_schedule_repo.dart';
import '../../features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

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

  //get baby growth data
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
}
