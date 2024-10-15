import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/features/forget_password/logic/cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/ui/forget_pass_screen.dart';
import 'package:care_nest/features/forget_password/ui/otp2_screen.dart';
import 'package:care_nest/features/forget_password/ui/otp3_screen.dart';
import 'package:care_nest/features/home/ui/home_screen.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/ui/login_screen.dart';
import 'package:care_nest/features/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/ui/sign_up_screen.dart';
import 'package:care_nest/features/sign_up/ui/verfiy_account_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const ksignUpScreen = '/signUpScreen';
  static const kloginScreen = '/loginScreen';
  static const konBoardingScreen = '/';
  static const khomeScreen = '/homeScreen';
  static const kForgetPassScreen = '/Otp1Screen';
  static const kOtp2Screen = '/Otp2Screen';
  static const kOtp3Screen = '/Otp3Screen';
  static const kVerfiyAccountScreen = '/VerfiyAccountScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: konBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: ksignUpScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: kloginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: khomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kForgetPassScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPassScreen(),
        ),
      ),
      GoRoute(
        path: kOtp2Screen,
        builder: (context, state) => const Otp2Screen(),
      ),
      GoRoute(
        path: kOtp3Screen,
        builder: (context, state) => const Otp3Screen(),
      ),
      GoRoute(
        path: kVerfiyAccountScreen,
        builder: (context, state) => const VerfiyAccountScreen(),
      ),
    ],
  );
}
