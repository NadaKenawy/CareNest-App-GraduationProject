import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/reminders/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/logic/add_medication_schedule_cubit/add_medication_schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMedicineBlocListner extends StatelessWidget {
  const AddMedicineBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicationScheduleCubit, AddMedicationScheduleState>(
      listenWhen: (previous, current) =>
          current is AddMedicationScheduleLoading ||
          current is AddMedicationScheduleSuccess ||
          current is AddMedicationScheduleError,
      listener: (context, state) {
        state.whenOrNull(
          addMedicationScheduleLoading: () => showLoadingIndicator(context),
          addMedicationScheduleSuccess: (addMedicationScheduleResponse) {
            Navigator.of(context).pop();

            Navigator.of(context).pop(true);
          },
          addMedicationScheduleError: (error) {
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
