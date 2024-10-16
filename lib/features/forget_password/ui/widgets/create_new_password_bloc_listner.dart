import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_state.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordBlocListener extends StatelessWidget {
  const CreateNewPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewPasswordCubit, CreatePasswordState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryBlueColor,
                ),
              ),
            );
          },
          success: (createNewPasswordRepo) {
            Navigator.of(context).pop();
            GoRouter.of(context).push(AppRouter.kLoginScreen);
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
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14DarkBlueMedium,
            ),
          ),
        ],
      ),
    );
  }
}
