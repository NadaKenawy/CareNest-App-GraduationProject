import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show a simple loading dialog with CircularProgressIndicator
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent dismiss by tapping outside
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryBlueColor,
                ),
              ),
            );
          },
          success: (loginResponse) {
            Navigator.of(context).pop(); // Close the loading dialog
            final userName = loginResponse.userData?.firstName ?? 'User';
            GoRouter.of(context).push(AppRouter.kHomeScreen,
                extra: userName); // Navigate to Home Screen
          },
          error: (error) {
            Navigator.of(context).pop(); // Close the loading dialog
            setupErrorState(context, error); // Show error using AwesomeDialog
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    // Show error dialog using AwesomeDialog
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: error,
      btnOkText: 'Got it',
      btnOkOnPress: () {}, // Action on OK press
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
