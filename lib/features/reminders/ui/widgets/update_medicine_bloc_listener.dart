import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/reminders/logic/update_medication_schedule_cubit/update_medication_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../logic/update_medication_schedule_cubit/update_medication_schedule_state.dart';

class UpdateMedicineBlocListener extends StatelessWidget {
  const UpdateMedicineBlocListener({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateMedicationScheduleCubit,
        UpdateMedicationScheduleState>(
      listenWhen: (previous, current) =>
          current is UpdateMedicationLoading ||
          current is UpdateMedicationSuccess ||
          current is UpdateMedicationError,
      listener: (context, state) {
        state.whenOrNull(
          updateMedicationLoading: () => showLoadingIndicator(context),
          updateMedicationSuccess: (updateMedicineResponse) {
            Navigator.of(context).pop();

            Navigator.of(context).pop(true);
          },
          updateMedicationError: (error) {
            Navigator.of(context).pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    // Ensure the error dialog is only shown when context is valid
    if (context.mounted) {
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

  void showLoadingIndicator(BuildContext context) {
    // Show loading indicator until the process is complete
    if (context.mounted) {
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
  }
}
