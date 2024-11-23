import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors_manager.dart';

class AddBabyBlocListener extends StatelessWidget {
  const AddBabyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddBabyCubit, AddBabyState>(
      listenWhen: (previous, current) =>
          current is AddBabyLoading ||
          current is AddBabySuccess ||
          current is AddBabyError,
      listener: (context, state) {
        state.whenOrNull(
          addBabyloading: () => showLoadingIndicator(context),
          addBabysuccess: (addBabyResponse) {
            Navigator.of(context).pop();
          },
          addBabyerror: (error) {
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
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
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
