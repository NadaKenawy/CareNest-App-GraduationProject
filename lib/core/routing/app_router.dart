import 'package:care_nest/features/login/ui/login_screen.dart';
import 'package:care_nest/features/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:care_nest/features/sign_up/ui/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
   static const ksignUpScreen = '/signUpScreen'; 
  static const kloginScreen = '/loginScreen';
  static const konBoardingScreen = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: konBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: ksignUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kloginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
