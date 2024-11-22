import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_baby_data_cubit/get_baby_data_cubit.dart';
import 'package:care_nest/features/add_baby/ui/add_baby_screen.dart';
import 'package:care_nest/features/add_baby/ui/baby_data_screen.dart';
import 'package:care_nest/features/add_baby/ui/my_babies_screen.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/forget_password/ui/forget_pass_screen.dart';
import 'package:care_nest/features/forget_password/ui/verify_password_screen.dart';
import 'package:care_nest/features/forget_password/ui/create_new_password_screen.dart';
import 'package:care_nest/features/home/ui/home_screen.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/ui/login_screen.dart';
import 'package:care_nest/features/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/ui/sign_up_screen.dart';
import 'package:care_nest/features/sign_up/ui/verfiy_account_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSignUpScreen = '/signUpScreen';
  static const kLoginScreen = '/loginScreen';
  static const kOnBoardingScreen = '/';
  static const kHomeScreen = '/homeScreen';
  static const kForgetPassScreen = '/forgetPassScreen';
  static const kVerifyPasswordScreen = '/verifyPasswordScreen';
  static const kCreateNewPasswordScreen = '/createNewPasswordScreen';
  static const kVerifyAccountScreen = '/verifyAccountScreen';
  static const kAddBabyScreen = '/addBabyScreen';
  static const kMyBabiesScreen = '/myBabiesScreen';
  static const kBabyDataScreen = '/babyDataScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: kOnBoardingScreen,
          builder: (context, state) {
            return const OnBoardingScreen();
          }),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
          path: kHomeScreen,
          builder: (context, state) {
            final userName = state.extra as String? ?? 'User';
            return HomeScreen(userName: userName);
          }),
      GoRoute(
        path: kForgetPassScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPassScreen(),
        ),
      ),
      GoRoute(
        path: kVerifyPasswordScreen,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<VerifyPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
          ),
        ], child: const VerifyPassword()),
      ),
      GoRoute(
        path: kCreateNewPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<CreateNewPasswordCubit>(),
          child: const CreateNewPasswordScreen(),
        ),
      ),
      GoRoute(
        path: kVerifyAccountScreen,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<VerifyAccountCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<SignupCubit>(),
          ),
        ], child: const VerifyAccountScreen()),
      ),
      GoRoute(
          path: kAddBabyScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<AddBabyCubit>(),
              child: const AddBabyScreen(),
            );
          }),
      GoRoute(
          path: kMyBabiesScreen,
          builder: (context, state) {
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
              ),
              BlocProvider(
                create: (context) => getIt<GetBabyDataCubit>(),
              ),
            ], child: const MyBabiesScreen());
          }),
      GoRoute(
        path: kBabyDataScreen,
        builder: (context, state) {
          final babyId = state.extra as String;
          return BlocProvider(
            create: (context) => getIt<GetBabyDataCubit>(),
            child: BabyDataScreen(
              babyId: babyId,
            ),
          );
        },
      )
    ],
  );
}
