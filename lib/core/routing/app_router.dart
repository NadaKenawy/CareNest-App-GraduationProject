import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_cubit.dart';
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
import 'package:care_nest/features/reminders/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/ui/add_medicine_screen.dart';
import 'package:care_nest/features/reminders/ui/reminders_screen.dart';
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
  static const kRemindersScreen = '/remindersScreen';
  static const kAddMedicineScreen = '/addMedicineScreen';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AddBabyCubit>(),
              ),
              // BlocProvider.value(
              //   value: state.extra as GetAllBabiesCubit,
              // ),
            ],
            child: const AddBabyScreen(),
          );
        },
      ),
      GoRoute(
        path: kMyBabiesScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteBabyCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpdateBabyCubit>(),
              ),
            ],
            child: const MyBabiesScreen(),
          );
        },
      ),
      GoRoute(
        path: kBabyDataScreen,
        builder: (context, state) {
          final babyData = state.extra as BabiesData;
          return BlocProvider(
            create: (context) => UpdateBabyCubit(getIt(), babyData),
            child: BabyDataScreen(
              babiesData: babyData,
            ),
          );
        },
      ),
      GoRoute(
          path: kRemindersScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<GetAllMedicationScheduleCubit>(),
              child: const RemindersScreen(),
            );
          }),
      GoRoute(
        path: kAddMedicineScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AddMedicationScheduleCubit(
                getIt()), // استخدم الكيوبت المناسب هنا
            child: const AddMedicineScreen(),
          );
        },
      ),
    ],
  );
}
