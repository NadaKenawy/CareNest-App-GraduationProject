import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/utils/snackbar.dart';
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
          success: (loginResponse) {
            context.pop(); // Close the loading dialog
            GoRouter.of(context)
                .push(AppRouter.kHomeScreen); // Navigate to Home Screen
          },
          error: (error) {
            context.pop(); // Close the loading dialog
            customSnackBar(
                context, error, Colors.red); // Show error as snack bar
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
