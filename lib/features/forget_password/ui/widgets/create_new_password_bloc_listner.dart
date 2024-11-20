import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/networking/api_error_model.dart';

class CreateNewPasswordBlocListener extends StatelessWidget {
  const CreateNewPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewPasswordCubit, CreatePasswordState>(
      listenWhen: (previous, current) =>
          current is CreateNewPasswordLoading ||
          current is CreateNewPasswordSuccess ||
          current is CreateNewPasswordError,
      listener: (context, state) {
        state.whenOrNull(
          createNewPasswordloading: () {
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
          createNewPasswordsuccess: (createNewPasswordRepo) {
            Navigator.of(context).pop();
            GoRouter.of(context).push(AppRouter.kLoginScreen);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.scale,
              title: 'Success',
              desc: 'Password updated successfully',
              btnOkText: 'OK',
              btnOkOnPress: () {}, // Action on OK press
              btnOkColor: ColorsManager.primaryBlueColor,
            ).show();
          },
          createNewPassworderror: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: apiErrorModel.message,
      btnOkText: 'Got it',
      btnOkOnPress: () {}, // Action on OK press
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }
}
