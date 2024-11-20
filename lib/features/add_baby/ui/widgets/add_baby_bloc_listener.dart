import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/features/add_baby/logic/cubit/add_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/cubit/add_baby_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
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
          addBabyloading: () {
            // Show loading indicator separately
            showLoadingIndicator(context);
          },
          addBabysuccess: (addBabyResponse) {
            // Close the loading dialog
            Navigator.of(context).pop();
            //GoRouter.of(context).push(AppRouter.kVerifyAccountScreen);
          },
          addBabyerror: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showLoadingIndicator(BuildContext context) {
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

  void showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Signup Successful',
      desc: 'Congratulations, you have signed up successfully!',
      btnOkOnPress: () {
        GoRouter.of(context).push(AppRouter.kLoginScreen);
      },
      btnOkColor: ColorsManager.primaryBlueColor,
    ).show();
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
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
