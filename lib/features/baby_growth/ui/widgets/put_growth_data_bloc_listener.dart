import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/put_growth_data_cubit/put_growth_data_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors_manager.dart';

class PutGrowthDataBlocListener extends StatelessWidget {
  const PutGrowthDataBlocListener({super.key, required this.babyId});
  final String babyId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PutGrowthDataCubit, PutGrowthDataState>(
      listenWhen: (previous, current) =>
          current is PutGrowthDataLoading ||
          current is PutGrowthDataSuccess ||
          current is PutGrowthDataError,
      listener: (context, state) {
        state.whenOrNull(
          putGrowthDataLoading: () => showLoadingIndicator(context),
          putGrowthDataSuccess: (putGrowthDataSuccess) {
            Navigator.of(context).pop();

            Navigator.of(context).pop(true);
          },
          putGrowthDataError: (error) {
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
