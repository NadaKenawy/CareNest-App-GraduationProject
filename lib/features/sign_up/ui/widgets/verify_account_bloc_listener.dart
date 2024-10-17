import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyAccountBlocListner extends StatelessWidget {
  const VerifyAccountBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyAccountCubit, VerifyAccountState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.scale,
              body: const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryBlueColor,
                ),
              ),
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
            ).show();
          },
          success: (verifyAccountResponse) {
            Navigator.of(context).pop(); // Close the loading dialog
            GoRouter.of(context)
                .push(AppRouter.kLoginScreen); // Navigate to login screen
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop(); // Close any previous dialog if open

    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: error,
      btnOkText: 'Got it',
      btnOkOnPress: () {}, // Action on button press
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
