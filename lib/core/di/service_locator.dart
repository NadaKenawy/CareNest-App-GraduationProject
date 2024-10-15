import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/core/networking/dio_factory.dart';
import 'package:care_nest/features/forget_password/data/repos/forget_pass_repo.dart';
import 'package:care_nest/features/forget_password/logic/cubit/forget_password_cubit.dart';
import 'package:care_nest/features/login/data/repos/login_repo.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
}
