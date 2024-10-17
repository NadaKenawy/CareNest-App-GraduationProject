import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator separately
            showLoadingIndicator(context);
          },
          success: (signupResponse) {
            // Close the loading dialog
            Navigator.of(context).pop();
            showSuccessDialog(context);
            GoRouter.of(context).push(AppRouter.kVerifyAccountScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent, 
          child: Center(
            child: CircularProgressIndicator(
              color: ColorsManager.primaryBlueColor,
            ),
          ),
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Signup Successful',
      desc: 'Congratulations, you have signed up successfully!',
      btnOkOnPress: () {
        GoRouter.of(context).push(AppRouter.kLoginScreen);
      },
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop(); 
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: error,
      btnOkOnPress: () {},
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
