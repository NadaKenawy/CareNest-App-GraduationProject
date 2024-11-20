import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/add_baby/data/repos/get_all_babies_repo.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/forget_password/data/repos/create_new_password.dart';
import 'package:care_nest/features/forget_password/data/repos/forget_pass_repo.dart';
import 'package:care_nest/features/forget_password/data/repos/verify_password_repo.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/login/data/repos/login_repo.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/data/repos/verify_account_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_baby/data/repos/add_baby_repo.dart';
import '../../features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';

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
  getIt.registerLazySingleton<GetAllBabiesRepo>(() => GetAllBabiesRepo(getIt()));
  getIt.registerFactory<GetAllBabiesCubit>(() => GetAllBabiesCubit(getIt()));
}
