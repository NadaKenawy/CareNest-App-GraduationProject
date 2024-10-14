import 'package:care_nest/core/networking/api_service.dart';
import 'package:care_nest/features/login/data/repos/login_repo.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<LoginRepo>(
    LoginRepo(
      getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<LoginCubit>(
    LoginCubit(
      getIt<LoginRepo>(),
    ),
  );
}
