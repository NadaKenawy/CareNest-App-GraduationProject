import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../logic/update_pass_cubit.dart';
import '../../logic/update_pass_state.dart';
import '../../../../../core/routing/app_router.dart';

class UpdatePassBlocListener extends StatelessWidget {
  const UpdatePassBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePassCubit, UpdatePassState>(
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
          success: (createNewPasswordRepo) {
            if (Navigator.canPop(context)) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(); // Close loading dialog
            }
            setupSuccessState(context);
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
    List<String> errorMessages = [];
    if (apiErrorModel.message != null && apiErrorModel.message!.isNotEmpty) {
      errorMessages.add(apiErrorModel.message!);
    }
    if (apiErrorModel.toJson()['errors'] != null) {
      final errors = apiErrorModel.toJson()['errors'] as List<dynamic>;
      for (var err in errors) {
        if (err['msg'] != null) {
          errorMessages.add(err['msg']);
        }
      }
    }
    if (errorMessages.isEmpty) {
      errorMessages.add('An error occurred');
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white.withValues(alpha: 0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 28),
            const SizedBox(width: 8),
            Text("Error",
                style: TextStyles.font24WhiteMedium.copyWith(
                  color: Colors.red,
                )),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: errorMessages
              .map((msg) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(msg, style: TextStyles.font16BlackMedium),
                  ))
              .toList(),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Got it",
                  style: TextStyles.font20BlackSemiMedium
                      .copyWith(color: Colors.red, fontSize: 18))),
        ],
      ),
    );
  }

  void setupSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white.withValues(alpha: 0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.check_circle_outline,
                color: Colors.green, size: 28),
            const SizedBox(width: 8),
            Text("Success",
                style: TextStyles.font24WhiteMedium.copyWith(
                  color: Colors.green,
                )),
          ],
        ),
        content: Text("Your password has been changed successfully",
            style: TextStyles.font16BlackMedium),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                GoRouter.of(context).go(AppRouter.kHomeScreen); // Go to home
              },
              child: Text("Got it",
                  style: TextStyles.font20BlackSemiMedium
                      .copyWith(color: Colors.green, fontSize: 18)))
        ],
      ),
    );
  }
}
