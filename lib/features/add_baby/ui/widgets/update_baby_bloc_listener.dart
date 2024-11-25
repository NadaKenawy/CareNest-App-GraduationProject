import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../logic/get_all_babies_cubit/get_all_babies_cubit.dart';

class UpdateBabyBlocListener extends StatelessWidget {
  const UpdateBabyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateBabyCubit, UpdateBabyState>(
      listenWhen: (previous, current) =>
          current is UpdateBabyLoading ||
          current is UpdateBabySuccess ||
          current is UpdateBabyError,
      listener: (context, state) {
        state.whenOrNull(
          updateBabyLoading: () => showLoadingIndicator(context),
          updateBabySuccess: (updateBabyResponse) {
            Navigator.of(context).pop();
            context.read<GetAllBabiesCubit>().getAllBabies();
            Navigator.of(context).pop(true);
          },
          updateBabyError: (error) {
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
