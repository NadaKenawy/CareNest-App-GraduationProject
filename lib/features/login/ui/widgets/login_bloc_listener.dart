import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/networking/api_error_model.dart';

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
          success: (loginResponse) {
            if (Navigator.canPop(context)) {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // Close loading dialog
            }
            final userName = loginResponse.userData?.firstName ?? 'User';
            GoRouter.of(context).go(AppRouter.kHomeScreen,
                extra: userName); // Navigate to Home Screen
          },
          error: (apiErrorModel) {
            if (Navigator.canPop(context)) {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // Close loading dialog
            }
            setupErrorState(
                context, apiErrorModel); // Show error using AwesomeDialog
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
