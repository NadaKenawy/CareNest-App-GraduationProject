import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/networking/api_error_model.dart';

class VerifyPassBlocListner extends StatelessWidget {
  const VerifyPassBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPasswordCubit, VerifyPasswordState>(
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
          success: (verifyPasswordResponse) {
            Navigator.of(context).pop();
            GoRouter.of(context).push(AppRouter.kCreateNewPasswordScreen);
          },
          error: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    Navigator.of(context).pop();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: apiErrorModel.message,
      btnOkText: 'Got it',
      btnOkOnPress: () {
        GoRouter.of(context).push(AppRouter.kVerifyPasswordScreen);
      },
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
