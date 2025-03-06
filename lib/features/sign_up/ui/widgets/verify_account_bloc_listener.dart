import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/networking/api_error_model.dart';

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
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryBlueColor,
                ),
              ),
            );
          },
          success: (verifyAccountResponse) {
            Navigator.of(context).pop();
            GoRouter.of(context).push(AppRouter.kLoginScreen);
          },
          error: (apiErrorModel) {
            if (Navigator.canPop(context)) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(); // Close loading dialog
            }
            setupErrorState(
              context,
              apiErrorModel,
            ); // Show error using AwesomeDialog
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: apiErrorModel.message,
      btnOkText: 'Got it',
      btnOkOnPress: () {},
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
