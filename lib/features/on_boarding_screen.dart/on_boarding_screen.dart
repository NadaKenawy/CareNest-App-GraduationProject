import 'package:care_nest/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoarding Screen'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLoginScreen);
          },
          child: const Text('Go to Login Screen'),
        ),
      ),
    );
  }
}
